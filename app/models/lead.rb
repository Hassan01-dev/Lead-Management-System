# frozen_string_literal: true

class Lead < ApplicationRecord
  belongs_to :user
  has_one :project # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :phases,  dependent: :destroy

  validates :lead_name, presence: true, length: { minimum: 5 }
  validates :platform_used, presence: true, length: { minimum: 3 }
  validates :lead_type, presence: true
  # validates :client_name, presence: true, format: { with: /\A[[:alpha:][:blank:]]+\z/ }
  # validates :client_contact, format: { with: /\A\d{11}\z/ }
end
