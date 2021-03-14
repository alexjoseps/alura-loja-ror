# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order(:name).limit 6
    @products_with_discount = Product.order(:price).limit 1
  end

  def search
    @name = params[:name]

    @products = ::Product.by_name(@name)
  end

  def create
    ::Product.create(product_params)

    redirect_to root_path
  end

  def destroy
    ::Product.destroy params[:id]

    redirect_to root_path
  end

  private

  def product_params
    params
      .require(:product)
      .permit(:name,
              :description,
              :price,
              :quantity)
  end
end
