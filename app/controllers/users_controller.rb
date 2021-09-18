# frozen_string_literal: true

class UsersController < ApplicationController
  layout 'dashboard'
  before_action :find_user, only: %i[edit update destroy] # rubocop:disable Rails/LexicallyScopedActionFilter
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
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :user_role, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
    authorize @user
  end
end
