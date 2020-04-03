# frozen_string_literal: true

class ProvincesController < ApplicationController
  before_action :set_province, only: %i[show edit update destroy]

  # GET /provinces.json
  def index
    @provinces = Province.order(:name)
  end

  # GET /provinces/1.json
  def show; end

  # POST /provinces.json
  def create
    @province = Province.new(province_params)

    if @province.save
      render :show, status: :created, location: @province
    else
      render json: @province.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /provinces/1.json
  def update
    if @province.update(province_params)
      render :show, status: :ok, location: @province
    else
      render json: @province.errors, status: :unprocessable_entity
    end
  end

  # DELETE /provinces/1.json
  def destroy
    @province.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_province
    @province = Province.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def province_params
    params.require(:province).permit(:name, :pst_rate, :hst_rate)
  end
end
