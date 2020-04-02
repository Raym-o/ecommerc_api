<<<<<<< HEAD
class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
=======
# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :set_address, only: %i[show update destroy]

>>>>>>> branchybranch
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

<<<<<<< HEAD
  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end
=======
  # GET /addresses/1.json
  def show; end
>>>>>>> branchybranch

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
<<<<<<< HEAD
  def edit
  end

  # POST /addresses
=======
  def edit; end

>>>>>>> branchybranch
  # POST /addresses.json
  def create
    @address = Address.new(address_params)

<<<<<<< HEAD
    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
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
=======
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
>>>>>>> branchybranch
end
