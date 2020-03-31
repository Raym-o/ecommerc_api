# frozen_string_literal: true

class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[show edit update destroy]

  # GET /collections.json
  def index
    @collections = Collection.all
  end

  # GET /collections/1.json
  def show; end

  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)

    if @collection.save
      render :show, status: :created, location: @collection
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /collections/1.json
  def update
    if @collection.update(collection_params)
      render :show, status: :ok, location: @collection
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    redirect_to collections_url, notice: 'Collection was successfully destroyed.'
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_collection
    @collection = Collection.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def collection_params
    params.require(:collection).permit(:title, :description, :slug)
  end
end
