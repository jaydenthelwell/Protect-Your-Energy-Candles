class AddressesController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    @user = current_user
    @addresses = @user.addresses
    @address = Address.new
  end

  def new
    @user = current_user
    @address = @user.addresses.build
  end

  def create
    Rails.logger.debug("Params: #{params.inspect}")
    @user = current_user
    Rails.logger.debug("current_user: #{@user.inspect}")

    if params[:address].present?
      @address = @user.addresses.build(address_params)

      if params[:address][:default] == '1'
        @user.set_primary_address(@address)
      elsif @user.addresses.empty?
        @address.primary = true
      end

      if @address.save
        redirect_to user_addresses_path(@user), notice: 'Address was successfully created.'
      else
        render :index
      end
    else
      flash[:alert] = 'Address parameters are missing.'
      redirect_to user_addresses_path(@user)
    end
  end

  def set_default
    @user = current_user
    Rails.logger.debug("Params: #{params.inspect}")
    @address = current_user.addresses.find(params[:id])

    @user.set_primary_address(@address)

    respond_to do |format|
      format.html { redirect_to user_addresses_path(@user), notice: 'Default address set successfully.' }
      format.js
    end
  end


  def destroy
    @address = current_user.addresses.find(params[:id])
    if @address.destroy
      flash[:notice] = "Address successfully deleted."
    else
      flash[:alert] = "Failed to delete address."
    end
    redirect_to user_addresses_path(current_user)
  end

  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :street, :city, :county, :postcode, :phone_number)
  end
end
