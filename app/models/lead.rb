# frozen_string_literal: true

class Lead < ApplicationRecord
  belongs_to :user
  has_one :project # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :phases,  dependent: :destroy

  validates :lead_name, presence: true
  validates :platform_used, presence: true, length: { minimum: 3 }
  validates :lead_type, presence: true
  validates :client_name, presence: true
  validates :client_contact, format: { with: /\A\d{11}\z/ }, allow_blank: true

  # after_create :confirmation_mail_create
  # after_update :confirmation_mail_update
  # after_destroy :confirmation_mail_destroy

  # private

  # def confirmation_mail_create
  #   LeadMailer.with(lead: @lead).lead_created.deliver_later
  #   flash[:success] = 'Lead Created Successfully.'
  # end

  # def confirmation_mail_update
  #   LeadMailer.with(lead: @lead, admin: current_user).lead_update.deliver_later
  #   flash[:notice] = 'Lead Updated Successfully.'
  # end

  # def confirmation_mail_destroy
  #   LeadMailer.with(lead: @lead, admin: current_user).lead_deleted.deliver_later
  #   flash[:alert] = 'Lead Deleted Successfully.'
  # end
end
