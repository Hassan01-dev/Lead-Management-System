# frozen_string_literal: true

class PhaseMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.phase_mailer.phase_created.subject
  #
  def phase_created
    @phase = params[:phase]
    @lead = @phase.lead
    @user = @lead.user
    @admin = params[:admin]
    mail to: @user.email,
         subject: 'Phase Created'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.phase_mailer.phase_deleted.subject
  #
  def phase_deleted
    @phase = params[:phase]
    @lead = @phase.lead
    @admin = params[:admin]
    mail to: [@lead.user.email, @phase.user.email],
         subject: 'Phase Deleted'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.phase_mailer.phase_update.subject
  #
  def phase_update
    @phase = params[:phase]
    @lead = @phase.lead
    @admin = params[:admin]
    mail to: [@lead.user.email, @phase.user.email],
         subject: 'Phase Edited'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.phase_mailer.phase_status.subject
  #
  def phase_status
    @phase = params[:phase]
    @lead = @phase.lead
    @admin = params[:admin]
    mail to: [@lead.user.email, @phase.user.email],
         subject: 'Phase Status Changed'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.phase_mailer.phase_assigned_TM.subject
  #
  def phase_assigned_TM # rubocop:disable Naming/MethodName
    @phase = params[:phase]
    @lead = @phase.lead
    @admin = params[:admin]
    mail to: @lead.user.email,
         subject: 'Phase Assigned'
  end
end
