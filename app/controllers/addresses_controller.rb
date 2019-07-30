class AddressesController < ApplicationController
  before_action :verify_auth_token
  # load_and_authorize_resource
  # before_action :authenticate_user!, except: [:index, :show]
  layout 'adminlayout'
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def new
    @address = Address.new
  end

  def create
    @state=State.find(params[:address][:state_id])
    @address=@state.addresses.create(address_params)  
    if @address.save
      redirect_to @address, notice: 'Address was successfully created.'
    else
      render 'new'
    end 
  end

  def index
    @addresses = Address.all
    render json:  @addresses 
  end

  def edit
  end

  def update
    if @address.update_attributes(address_params)
      redirect_to @address, notice: 'Address was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to addresses_path, notice: 'Address was successfully destroyed.'
  end
  private
  def set_address
    @address = Address.find(params[:id])
  end
  def address_params
     params.require(:address).permit(:area_name,:road_name,:landmark,:city_name,:remarks,:pincode,:state_id)
  end
end
