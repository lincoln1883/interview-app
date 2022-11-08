# frozen_string_literal: true

class ApiController < ApplicationController
  def stock_and_pricing
    # In the real world this call takes a second or two.
    sleep 1

    account = current_account
    raise "Account was not found" if account.blank?

    product = Product.find(params[:sku])

    output = {
      pricing: {
        retail: {
          base: {
            usd: product.base_price__retail(:usd, :unit, :single),
            cad: product.base_price__retail(:cad, :unit, :single)
          },
          markup: {
            usd: product.retail_price(account: account, currency: :usd, unit: :unit, type: :single),
            cad: product.retail_price(account: account, currency: :cad, unit: :unit, type: :single)
          },
          customer: {
            usd: product.your_price_retail(account, :usd, :unit),
            cad: product.your_price_retail(account, :cad, :unit)
          }
        },
        net: {
          base: {
            usd: product.base_price__net(:usd, :unit, :single),
            cad: product.base_price__net(:cad, :unit, :single)
          },
          account_cost: {
            usd: product.your_price_net(account, :usd, :unit),
            cad: product.your_price_net(account, :cad, :unit)
          },
          piece: {
            usd: product.your_price_net(account, :usd, :piece),
            cad: product.your_price_net(account, :cad, :piece)
          },
          halfpiece: {
            usd: product.your_price_net(account, :usd, :halfpiece),
            cad: product.your_price_net(account, :cad, :halfpiece)
          },
          customer: {
            unit: product.order_price__net(current_user, :unit),
            piece: product.order_price__net(current_user, :piece),
            halfpiece: product.order_price__net(current_user, :halfpiece)
          }
        }
      },
      stock: product.stock(current_user)&.merge(unit: product.measured_unit)
    }

    output[:uom_display_text] = product.measured_unit["uom_display_text"] if product.measured_unit["uom_display_text"].present?

    if product.wallcovering?
      output[:measured_unit] = product.measured_unit["long"]["singular"].downcase
      output[:order_increment] = product.wallcovering_data.average_bolt.to_f
    end

    output[:pricing].delete(:net) unless current_user.has_role?(:view_net_pricing_usd) || current_user.has_role?(:view_net_pricing_cad)
    output.delete(:stock) unless current_user.has_role?(:view_stock)

    @product = product
    @stock_output = output[:stock].deep_symbolize_keys

    @stock_total = @stock_output[:current][:total]
    @stock_unit = @stock_output[:unit][:long][@stock_total == 1 ? :singular : :plural]

    @stock_total_reserved = @stock_output[:total_reserved]
    @stock_total_reserved_unit = @stock_output[:unit][:long][@stock_total_reserved == 1 ? :singular : :plural]

    @has_stock = @stock_total.present? && @stock_total.to_f.positive?
    @has_availability = @stock_output[:availability].present?
    @incoming_stock = @stock_output[:expected]

    # Get all bolts and separate them into "regular bolts" and "small cuts"
    @bolts = @stock_output[:current][:bolts]

    # Small cuts applies to fabric sold by the yard, excluding Clarencehouse
    if !clarencehouse? && @product.fabric? && @product.measured_unit["long"]["singular"] == "Yard"
      @regular_bolts, @small_cuts = @bolts.partition { |_bolt, lot| lot[:quantity].to_f >= 5 } if @bolts.present?
    else
      @regular_bolts = @bolts
      @small_cuts = nil
    end

    # Group and sort by dye lot number
    @regular_bolts_dye_lots = @regular_bolts.group_by { |_bolt, lot| lot[:dye_lot] } if @regular_bolts.present?
    @small_cuts_dye_lots = @small_cuts.group_by { |_bolt, lot| lot[:dye_lot] } if @small_cuts.present?
  rescue => e
    render json: { success: false, error: e.message }, status: :unprocessable_entity
  end
end
