# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/lead_mailer
class LeadMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/lead_mailer/lead_created
  def lead_created
    LeadMailer.with(lead: Lead.first).lead_created
  end

  # Preview this email at http://localhost:3000/rails/mailers/lead_mailer/lead_deleted
  def lead_deleted
    LeadMailer.with(lead: Lead.last, admin: User.last).lead_deleted
  end

  # Preview this email at http://localhost:3000/rails/mailers/lead_mailer/lead_update
  def lead_update
    LeadMailer.with(lead: Lead.last, admin: User.last).lead_update
  end

  # Preview this email at http://localhost:3000/rails/mailers/lead_mailer/lead_status
  def lead_status
    LeadMailer.with(lead: Lead.last, admin: User.last).lead_status
  end
end
