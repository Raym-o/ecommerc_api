# frozen_string_literal: true

class OrderProductsController < ApplicationController
  before_action :set_order_product, only: %i[show edit update destroy]

  # GET /order_products.json
  def index
    @order_products = OrderProduct.all
  end

  # GET /order_products/1.json
  def show; end

  # POST /order_products.json
  def create
    @order_product = OrderProduct.new(order_product_params)

    if @order_product.save
      render :show, status: :created, location: @order_product
    else
      render json: @order_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_products/1.json
  def update
    if @order_product.update(order_product_params)
      render :show, status: :ok, location: @order_product
    else
      render json: @order_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_products/1.json
  def destroy
    @order_product.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order_product
    @order_product = OrderProduct.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_product_params
    params.require(:order_product).permit(:price, :order_id, :product_id)
  end
end
