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
        @user.addresses.update_all(default: false)
        @address.default = true
      elsif @user.addresses.empty?
        @address.default = true
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

    current_user.addresses.update_all(default: false)

    if @address.update(default: true)
      flash[:notice] = "Default address set successfully."
    else
      flash[:alert] = "Failed to set default address. Errors: #{address.errors.full_messages.to_sentence}"
    end
    @user.reload

    redirect_to user_addresses_path(current_user)
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
