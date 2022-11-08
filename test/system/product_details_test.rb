# frozen_string_literal: true

require "application_system_test_case"

class ProductDetailsTest < ApplicationSystemTestCase
  test "price" do
    visit product_url(products(:test))
    assert_selector ".product-price .usd-price", text: "$19.00 / yd USD"
    assert_selector ".product-price .cad-price", text: "$32.50 / yd CAD"
  end

  test "stock" do
    visit product_url(products(:test))
    assert_selector "#product-stock-container .stock-amount .contents", text: "447 Yards"

    click_on "Show more details"
    assert_selector "#bolts-and-small-cuts-container .bolts .details-container:nth-child(1) .bolt", text: "Bolt #1971"
    assert_selector "#bolts-and-small-cuts-container .bolts .details-container:nth-child(1) .yards", text: "27.73 Yds"

    click_on "Reload"
    assert_selector "#product-stock-container .stock-amount .contents", text: "447 Yards"
  end
end
