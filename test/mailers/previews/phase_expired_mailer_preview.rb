# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/phase_expired_mailer
class PhaseExpiredMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/phase_expired_mailer/phase_expired
  def phase_expired
    PhaseExpiredMailer.with(phase: Phase.first).phase_expired
  end
end
