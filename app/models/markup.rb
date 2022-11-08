# frozen_string_literal: true

# Mocked from real app
class Markup
  include ActiveModel::Model

  attr_accessor :multiplier
  attr_accessor :round_to

  def self.find_for_product(*)
    new(multiplier: 1.0, round_to: 0.50)
  end

  def apply_to(base_price)
    return nil if base_price.nil?
    raise ArgumentError, "base_price should be numeric" unless base_price.is_a? Numeric

    price = (base_price.to_f * multiplier.to_f).to_d.truncate(3)

    case round_to
    when 0.01
      price.round(2, :up)
    when 0.10
      price.round(1, :up)
    when 0.50
      (price * 2).ceil / 2.0
    when 1.00
      price.round(0, :up)
    end.to_f
  end
end
