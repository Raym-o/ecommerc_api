# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders.json
  def index
    @orders = Order.includes(:products).all
  end

  # GET /orders/1.json
  def show; end

  # POST /orders.json
  def create
    @order = Order.new(order_params)

    if @order.save
      render :show, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1.json
  def update
    if @order.update(order_params)
      render :show, status: :ok, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
    ed
  end

  # DELETE /orders/1.json
  def destroy
    @order.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:status, :price, :pst, :gst, :hst, :customer_id)
  end
end
