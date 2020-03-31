# frozen_string_literal: true

class CollectionProductsController < ApplicationController
  before_action :set_collection_product, only: %i[show edit update destroy]

  # GET /collection_products.json
  def index
    @collection_products = CollectionProduct.all
  end

  # GET /collection_products/1.json
  def show; end

  # POST /collection_products.json
  def create
    @collection_product = CollectionProduct.new(collection_product_params)

    if @collection_product.save
      render :show, status: :created, location: @collection_product
    else
      render json: @collection_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /collection_products/1.json
  def update
    if @collection_product.update(collection_product_params)
      render :show, status: :ok, location: @collection_product
    else
      render json: @collection_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /collection_products/1.json
  def destroy
    @collection_product.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_collection_product
    @collection_product = CollectionProduct.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def collection_product_params
    params.require(:collection_product).permit(:collection_id, :product_id)
  end
end
