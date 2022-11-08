# frozen_string_literal: true

module PricingHelper
  def pricing_html(pricing_type, product, account, currency, unit, display_for = nil, options = {})
    permission = ("view_retail_pricing_" + currency.to_s).to_sym if ([pricing_type] & [:base_retail, :your_retail, :basic_pricing, :outlet_pricing]).present?
    permission = ("view_net_pricing_" + currency.to_s).to_sym if ([pricing_type] & [:piece_base, :your_piece, :base_net, :your_net, :outlet_pricing]).present?

    if current_user.can_view_pricing? && current_user.has_role?(permission)
      price = case pricing_type
              when :your_retail
                # Single unit product price with your account discount * markup
                product.your_price_retail(account, currency, unit)
              when :base_retail
                # Single unit product price net * 2 || Piece net price from product info * 2
                product.base_price__retail(currency, unit, :single, account)
              when :your_net, :your_piece
                # Single unit product price with your account discount
                current_account.showroom? && !current_user.has_role?(:view_your_net_price) ? nil : product.your_price_net(account, currency, unit)
              when :base_net, :piece_base
                # Single unit product price || Piece price from product info
                product.base_price__net(currency, unit, :single, account)
              when :basic_pricing, :outlet_pricing
                # Product detail page pricing. Product price * 2 (No markup)
                product.retail_price(account: account, currency: currency, unit: unit, type: :single)
              end
    end

    return unless price

    human_price = humanized_pricing(product, price, currency, display_for, options)

    content_tag(:div, class: "product-price") do
      if clarencehouse?
        format_price(human_price)
      elsif pricing_type == :outlet_pricing
        outlet_price = product.outlet_price(account, currency, unit)
        markup = Markup.find_for_product(account: account, product: product)
        outlet_price = markup.apply_to(outlet_price)
        outlet_price = format_price(outlet_price)
        html = content_tag(:span, outlet_price, class: "#{currency}-price outlet-price line-through discontinued", data: { price: price })
        html += content_tag(:span, human_price, class: "#{currency}-price", data: { price: price })
        html
      else
        content_tag(:span, human_price, class: "#{currency}-price", data: { price: price })
      end
    end
  end

  def humanized_pricing(product, price, currency = :usd, display_for = nil, options = {})
    content = ""

    if product.measured_unit["uom_display_text"].present?
      return "#{number_to_currency(price)} #{humanized_currency(currency)} #{product.measured_unit["uom_display_text"]}"
    end

    unit = product.measured_unit["short"]["singular"].downcase
    unit = product.measured_unit["long"]["singular"].downcase if unit == "3 panel"

    if unit == "dblrl"
      price /= product.wallcovering_unit_divisor
      unit = "sglrl"
    end

    if unit == "sglrl" && display_for != :quick
      content = "#{number_to_currency(price)} #{humanized_currency(currency)} per single roll (#{sold_as_units(product)})"
    elsif unit == "sglrl" && product.product_type == "wallcovering"
      content = content_tag(:span, "#{number_to_currency(price)} / ")
      content << content_tag(:small, "Single Roll #{humanized_currency(currency)}")
    else
      separator = clarencehouse? ? "per" : "/"
      content = "#{number_to_currency(price)} #{separator} #{unit} #{humanized_currency(currency)}"
    end

    if unit == "sqft" && options["total_sqft"].present?
      unit_total = price * options["total_sqft"].to_f
      content = content_tag(:span, "#{number_to_currency(unit_total)} #{humanized_currency(currency)} per unit", class: "per_unit_pricing")
      content << content_tag(:span, "#{number_to_currency(price)} #{humanized_currency(currency)} per sq.ft.", class: "per_sqft_pricing")
    end

    if options["display_type"].present? && options["display_type"] == "available rug pad"
      if unit == "sqft" && options["total_sqft"].present?
        unit_total = price * options["total_sqft"].to_f
        content = "#{number_to_currency(unit_total)} #{humanized_currency(currency)}"
      else
        content = "#{number_to_currency(price)} #{humanized_currency(currency)}"
      end
    end

    content
  end

  def humanized_currency(currency)
    symbol = currency.to_sym == :usd && current_user.can_view_cad_pricing? || current_account.currency_code == "cad" ? "USD" : ""
    symbol = "CAD" if current_user.can_view_cad_pricing? && currency.to_sym == :cad
    symbol
  end
end
