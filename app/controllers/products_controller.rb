class ProductsController < ApplicationController
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
  end
  private
  def product_params
    params.require(:product).permit(:price, :name, :explanation, :brand, :condition, :prefecture_id, :preparationdays, :is_shipping_buyer, :saler_id, :buyer_id, :category)
  end
end


