class CollectionProductsController < ApplicationController
  before_action :set_collection_product, only: [:show, :edit, :update, :destroy]

  # GET /collection_products
  # GET /collection_products.json
  def index
    @collection_products = CollectionProduct.all
  end

  # GET /collection_products/1
  # GET /collection_products/1.json
  def show
  end

  # GET /collection_products/new
  def new
    @collection_product = CollectionProduct.new
  end

  # GET /collection_products/1/edit
  def edit
  end

  # POST /collection_products
  # POST /collection_products.json
  def create
    @collection_product = CollectionProduct.new(collection_product_params)

    respond_to do |format|
      if @collection_product.save
        format.html { redirect_to @collection_product, notice: 'Collection product was successfully created.' }
        format.json { render :show, status: :created, location: @collection_product }
      else
        format.html { render :new }
        format.json { render json: @collection_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collection_products/1
  # PATCH/PUT /collection_products/1.json
  def update
    respond_to do |format|
      if @collection_product.update(collection_product_params)
        format.html { redirect_to @collection_product, notice: 'Collection product was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection_product }
      else
        format.html { render :edit }
        format.json { render json: @collection_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_products/1
  # DELETE /collection_products/1.json
  def destroy
    @collection_product.destroy
    respond_to do |format|
      format.html { redirect_to collection_products_url, notice: 'Collection product was successfully destroyed.' }
      format.json { head :no_content }
    end
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
