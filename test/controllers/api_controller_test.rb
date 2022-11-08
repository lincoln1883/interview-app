# frozen_string_literal: true

require "test_helper"

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get stock_and_pricing" do
    get api_stock_and_pricing_url(sku: products(:test).id), xhr: true
    assert_response :success
  end
end
