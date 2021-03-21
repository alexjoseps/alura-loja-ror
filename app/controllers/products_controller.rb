# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[update edit show destroy]
  def index
    @products = Product.order(:name).limit 6
    @products_with_discount = Product.order(:price).limit 1
  end

  def search
    @name = params[:name]

    @products = ::Product.by_name(@name)
  end

  def new
    @departments = ::Department.all
    @product = ::Product.new
  end

  def create
    @product = ::Product.new(product_params)

    if @product.save
      flash[:notice] = 'Produto cadastrado com sucesso'
      redirect_to root_path
    else
      render_the :new
    end
  end

  def edit
    render_the :edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Produto editado com sucesso'
      redirect_to root_path
    else
      render_the :edit
    end
  end

  def destroy
    @product.destroy

    redirect_to root_path
  end

  private

  def set_product
    @product = ::Product.find params[:id]
  end

  def render_the(view)
    @departments = ::Department.all
    render view
  end

  def product_params
    params
      .require(:product)
      .permit(:name,
              :description,
              :price,
              :quantity,
              :department_id)
  end
end
