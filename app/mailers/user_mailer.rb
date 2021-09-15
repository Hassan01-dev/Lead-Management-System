# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_created.subject
  #
  def user_created
    @admin = params[:admin]
    @user = params[:user]
    @greeting = 'Hi'

    mail to: @user.email,
         subject: 'User Created Successfully'
  end
end
