# frozen_string_literal: true

require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get products_url
    assert_response :success
  end

  test "show" do
    get product_url(products(:test))
    assert_response :success
    assert_select ".product-price .usd-price", "$19.00 / yd USD"
    assert_select ".product-price .cad-price", "$32.50 / yd CAD"
  end
end
