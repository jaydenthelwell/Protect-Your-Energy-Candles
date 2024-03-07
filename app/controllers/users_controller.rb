class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :update]

  def show
    @user = current_user
    @address = @user.addresses.first
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile was successfully updated.'
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :second_name, :email, :password, :password_confirmation, :d_o_b)
  end
end
