# frozen_string_literal: true

class UsersController < ApplicationController
  layout 'dashboard'
  before_action :find_user, only: %i[edit update password_change] # rubocop:disable Rails/LexicallyScopedActionFilter
  before_action :find_user_for_custom_action, only: %i[activate disabled]
  before_action :check_user_auth, only: %i[edit update] # rubocop:disable Rails/LexicallyScopedActionFilter

  def index
    @users = User.order(:user_role).page(params[:page]).per(10)
    authorize @users
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      UserMailer.with(admin: current_user, user: @user).user_created.deliver_later
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_update_params)
      current_user.has_role?(:admin) ? (redirect_to users_path) : (redirect_to leads_path)
    else
      render :edit
    end
  end

  def disabled
    authorize @user, :update?
    @user.toggle!(:active) # rubocop:disable Rails/SkipsModelValidations
  end

  def activate
    authorize @user, :update?
    @user.toggle!(:active) # rubocop:disable Rails/SkipsModelValidations
  end

  def password_change; end

  def password_update
    @user = current_user
    if @user.update(user_update_password_params)
      if current_user.has_role? :admin
        redirect_to users_path
      else
        redirect_to destroy_user_session_path
      end
    else
      render :password_change
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :user_role, :email, :password, :password_confirmation)
  end

  def user_update_params
    params.require(:user).permit(:user_name, :user_role, :email)
  end

  def user_update_password_params
    params.permit(:password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def check_user_auth
    authorize @user if current_user && (current_user.id != @user.id)
  end

  def find_user_for_custom_action
    @user = User.find(params[:format])
  end
end
