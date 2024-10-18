class LandingController < ApplicationController
  before_action :set_devise_resource, only: [:index]

  def index
    # Hier wird deine Landing-Seite gerendert
  end

  def after_sign_in_path_for(resource)
    flash.delete(:notice)
    user_root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    flash.delete(:notice)
    root_path
  end

  private

  def set_devise_resource
    @resource = User.new
    @resource_name = :user
    @devise_mapping = Devise.mappings[:user]
  end
end