# frozen_string_literal: true

module ProductsHelper
  def product_image_url(product)
    "https://s3.amazonaws.com/fabricut.img/img/product_images/#{product.id}.jpg"
  end

  def product_thumbnail_image_url(product)
    "https://s3.amazonaws.com/fabricut.img/img/product_images/thumbnails/#{product.id}.jpg"
  end
end
