# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!

  def index; end

  def show; end

  def create; end

  def new; end

  def edit; end

  def update; end

  def destroy; end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referer || root_path)
  end

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || leads_path
  end
end
