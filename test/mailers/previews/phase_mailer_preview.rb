# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/phase_mailer
class PhaseMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/phase_mailer/phase_created
  def phase_created
    PhaseMailer.with(phase: Phase.first, admin: User.last).phase_created
  end

  # Preview this email at http://localhost:3000/rails/mailers/phase_mailer/phase_deleted
  def phase_deleted
    PhaseMailer.with(phase: Phase.first, admin: User.last).phase_deleted
  end

  # Preview this email at http://localhost:3000/rails/mailers/phase_mailer/phase_update
  def phase_update
    PhaseMailer.with(phase: Phase.first, admin: User.last).phase_update
  end

  # Preview this email at http://localhost:3000/rails/mailers/phase_mailer/phase_status
  def phase_status
    PhaseMailer.with(phase: Phase.first, admin: User.last).phase_status
  end

  # Preview this email at http://localhost:3000/rails/mailers/phase_mailer/phase_assigned_TM
  def phase_assigned_TM # rubocop:disable Naming/MethodName
    PhaseMailer.with(phase: Phase.first, admin: User.last).phase_assigned_TM
  end
end
