# frozen_string_literal: true

class Product < ApplicationRecord
  validates :pattern_name, :color_name, presence: true

  # Mocked from real app
  def base_pricing
    self[:price]
  end

  # Mocked from real app
  def stock(*)
    self[:stock]
  end

  # Mocked from real app
  def product_type
    "fabric"
  end

  def fabric?
    (product_type == "fabric")
  end

  def trimming?
    (product_type == "trimming")
  end

  def hardware?
    (product_type == "hardware")
  end

  def wallcovering?
    (product_type == "wallcovering")
  end

  def accessory?
    (product_type == "accessory")
  end

  def leather?
    (product_type == "leather")
  end

  # Mocked from real app
  def upholstery?
    false
  end

  def extract_price_type(account, unit)
    account&.export? && unit != :unit ? "per_#{unit}_export" : "per_#{unit}"
  end

  def base_price__net(currency = :usd, unit = :unit, type = :single, account = nil)
    currency = ([currency.to_s.to_sym] & [:usd, :cad]).pop
    unit = ([unit.to_s.to_sym] & [:unit, :piece, :halfpiece]).pop
    type = account&.export? ? :export : ([type.to_s.to_sym] & [:single, :tiered, :export]).pop

    price = base_pricing[currency.to_s]&.dig(extract_price_type(account, unit))
    price = price[type.to_s] if price.is_a? Hash
    return nil if price.nil?

    case type
    when :single, :export
      raise "unexpected pricing structure" unless price.is_a? Numeric

      price
    when :tiered
      raise "unexpected pricing structure" unless price.is_a? Array

      price.map do |i|
        i["price"] = i["price"].to_f
        i
      end
    end
  end

  def base_price__retail(currency = :usd, unit = :unit, type = :single, account = nil)
    price = base_price__net(currency, unit, type, account)
    return nil if price.nil?

    case type
    when :single, :export
      price * 2
    when :tiered
      price.map do |i|
        i["price"] *= 2
        i
      end
    end
  end

  def retail_price(account:, currency: :usd, unit: :unit, type: :single)
    currency = ([currency.to_s.to_sym] & [:usd, :cad]).pop
    unit = ([unit.to_s.to_sym] & [:unit, :piece, :halfpiece]).pop
    type = ([type.to_s.to_sym] & [:single, :tiered, :export]).pop

    markup = Markup.find_for_product(account: account, product: self)
    price = base_price__net(currency, unit, type, account)
    return nil if price.nil?

    case type
    when :single, :export
      markup.apply_to(price)
    when :tiered
      price.map do |i|
        i["price"] = markup.apply_to(i["price"])
        i
      end
    end
  end

  def your_price_net(account, currency, unit = :unit)
    unit = ([unit.to_s.to_sym] & [:unit, :piece, :halfpiece]).pop

    return nil unless account

    price = FabricutApi.call(:get, [:product, id, "stock+", account&.account_id])&.dig("pricing")
    return nil if price.nil?

    type = "per_" + unit.to_s + "_" + currency.to_s
    price[type]
  end

  def your_price_retail(account, currency, unit = :unit)
    return nil unless account

    markup = Markup.find_for_product(account: account, product: self)
    price = your_price_net(account, currency, unit)
    return nil if price.nil?

    markup.apply_to(price)
  end

  def order_price__net(user, unit = :unit, promo_code = nil)
    pricing = order_pricing(user: user, unit: unit, promo_code: promo_code)
    pricing&.dig("order_price")
  end

  def order_pricing(options)
    # We'll take an account_id, an account, or a user; any one of these 3 will do.
    account_id = options[:account_id] || options[:account]&.account_id || options[:user]&.account_id_by_site(:residential)
    return nil unless account_id

    order_type = options.fetch(:order_type, :regular_order).to_s.to_sym
    return nil unless order_type.in? %i[regular_order cfa hold cutting regular_memo showroom_memo]

    unit = options.fetch(:unit, :unit).to_s.to_sym
    return nil unless unit.in? %i[unit piece halfpiece]

    quantity = options[:quantity]&.to_f || 1.0
    promo_code = options[:promo_code].to_s

    FabricutApi.call(
      :get,
      [:"cart-pricing", account_id],
      id: -1,
      product_id: id,
      order_type: order_type,
      sellable_unit: unit,
      quantity: quantity,
      promo_code: promo_code
    )
  end

  # Mocked from real app
  def measured_unit
    {
      "short" => { "singular" => "Yd", "plural" => "Yds" },
      "long" => { "singular" => "Yard", "plural" => "Yards" },
      "uom_display_text" => nil
    }
  end

  # Mocked from real app
  def is_discontinued?
    false
  end
end
