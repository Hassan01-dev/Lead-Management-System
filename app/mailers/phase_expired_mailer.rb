# frozen_string_literal: true

class PhaseExpiredMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.phase_expired_mailer.phase_expired.subject
  #
  def phase_expired
    @phase = params[:phase]
    @user = @phase.user
    mail to: @user.email,
         subject: 'Phase Expired'
  end
end
