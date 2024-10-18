class Users::TwoFactorAuthController < ApplicationController
  before_action :authenticate_user!

  def new
    current_user.generate_two_factor_secret_if_missing!
  end

  def create
    if current_user.validate_and_consume_otp!(params[:otp_attempt])
      current_user.enable_two_factor!
      if user_signed_in?
        redirect_to user_root_path, notice: '2FA enabled successfully'
      else
        redirect_to root_path, notice: '2FA enabled successfully'
      end

    else
      flash.now[:alert] = 'Invalid code, please try again'
      render :new
    end
  end

  def destroy
    current_user.disable_two_factor!
    if user_signed_in?
      redirect_to user_root_path, notice: '2FA disabled successfully'
    else
      redirect_to root_path, notice: '2FA disabled successfully'
    end
  end
end
