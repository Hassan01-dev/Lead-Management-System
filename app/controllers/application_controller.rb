# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def index; end

  def show; end

  def create; end

  def new; end

  def edit; end

  def update; end

  def destroy; end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :user_role, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:user_name, :user_role, :name, :email, :password, :current_password)
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end
end
