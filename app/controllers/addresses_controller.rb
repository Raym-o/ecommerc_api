# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :set_address, only: %i[show update destroy]

  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1.json
  def show; end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit; end

  # POST /addresses.json
  def create
    @address = Address.new(address_params)

    if @address.save
      render :show, status: :created, location: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/1.json
  def update
    if @address.update(address_params)
      render :show, status: :ok, location: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_address
    @address = Address.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def address_params
    params.require(:address).permit(:line_1, :line_2, :city, :postal_code, :province_id, :customer_id)
  end
end
