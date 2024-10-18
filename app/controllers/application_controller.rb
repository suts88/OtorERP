class ApplicationController < ActionController::Base
  before_action :set_devise_vars

  def after_sign_out_path_for(resource_or_scope)
    flash.delete(:notice)
    root_path
  end

  private

  def set_devise_vars
    unless user_signed_in?
      @resource = User.new
      @resource_name = :user
      @devise_mapping = Devise.mappings[:user]
    end
  end
end
