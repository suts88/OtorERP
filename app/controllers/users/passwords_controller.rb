# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  protected

  def after_sending_reset_password_instructions_path_for(resource_name)
    if user_signed_in?
      user_root_path
    else
      root_path
    end
  end

# Überschreibe den Redirect nach dem erfolgreichen Passwort-Reset
def after_resetting_password_path_for(resource)
  if user_signed_in?
    user_root_path
  else
    root_path
  end
end
end
