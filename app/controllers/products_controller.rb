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

  def new
    @departments = ::Department.all
    @product = ::Product.new
  end

  def create
    @departments = ::Department.all
    @product = ::Product.new(product_params)

    if @product.save
      flash[:notice] = 'Produto cadastrado com sucesso'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @product = ::Product.find(params[:id])
    @departments = ::Department.all
    render :new
  end

  def update
    @product = ::Product.find(params[:id])
    @departments = ::Department.all
    if @product.update(product_params)
      flash[:notice] = 'Produto editado com sucesso'
      redirect_to root_path
    else
      @departments = ::Department.all
      render :new
    end
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
              :quantity,
              :department_id)
  end
end
