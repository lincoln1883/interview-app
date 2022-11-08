# frozen_string_literal: true

# This simulates our real API client by returning some static data.
class FabricutApi
  class Error < StandardError
  end

  def self.call(method_name, path, params = [], *)
    if method_name == :get && path[0] == :product && path[2] == "stock+"
      return simulate_stockplus(path[1], path[3])
    end
    if method_name == :get && path[0] == :"cart-pricing"
      return simulate_cart_pricing(params)
    end

    raise Error, "This API simulator doesn't support that!"
  end

  def self.simulate_stockplus(product_id, _account_id)
    # Silenced since this normally happens outside our app
    product = Rails.logger.silence { Product.find(product_id) }

    {
      "pricing" => {
        "per_unit" => product.price["usd"]["per_unit"]["single"],
        "per_unit_usd" => product.price["usd"]["per_unit"]["single"],
        "per_unit_cad" => product.price["cad"]["per_unit"]["single"],
        "per_piece" => product.price["usd"]["per_piece"],
        "per_piece_usd" => product.price["usd"]["per_piece"],
        "per_piece_cad" => product.price["cad"]["per_piece"],
        "per_halfpiece" => product.price["usd"]["per_halfpiece"],
        "per_halfpiece_usd" => product.price["usd"]["per_halfpiece"],
        "per_halfpiece_cad" => product.price["cad"]["per_halfpiece"]
      },
      "stock" => product.stock
    }
  end

  def self.simulate_cart_pricing(params)
    # Silenced since this normally happens outside our app
    product = Rails.logger.silence { Product.find(params[:product_id]) }

    {
      "success" => true,
      "error" => "",
      "id" => -1,
      "line_total" => product.price["usd"]["per_unit"]["single"],
      "discounted_percentage1" => 0.0,
      "discounted_percentage2" => 0.0,
      "split_commission" => false,
      "uses_discount" => false,
      "uses_promo_code" => false,
      "price_type" => "",
      "base_price" => product.price["usd"]["per_unit"]["single"],
      "order_price" => product.price["usd"]["per_unit"]["single"],
      "savings" => 0.0
    }
  end
end
