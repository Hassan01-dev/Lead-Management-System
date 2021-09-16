# frozen_string_literal: true

class LeadMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lead_mailer.lead_created.subject
  #
  def lead_created
    @lead = params[:lead]
    @user = @lead.user
    mail to: @user.email,
         subject: 'Lead Created'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lead_mailer.lead_deleted.subject
  #
  def lead_deleted
    @lead = params[:lead]
    @user = @lead.user
    @admin = params[:admin]
    mail to: @user.email,
         subject: 'Lead Deleted'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lead_mailer.lead_update.subject
  #
  def lead_update
    @lead = params[:lead]
    @user = @lead.user
    @admin = params[:admin]
    mail to: @user.email,
         subject: 'Lead Update'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lead_mailer.lead_status.subject
  #
  def lead_status
    @lead = params[:lead]
    @user = @lead.user
    @admin = params[:admin]
    mail to: @user.email,
         subject: 'Lead Status Changed'
  end
end
