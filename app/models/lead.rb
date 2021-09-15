# frozen_string_literal: true

class Lead < ApplicationRecord
  belongs_to :user
  has_one :project # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :phases # rubocop:disable Rails/HasManyOrHasOneDependent

  validates :lead_name, presence: true
  validates :platform_used, presence: true, length: { minimum: 3 }
  validates :lead_type, presence: true
  validates :client_name, presence: true
  validates :client_contact, presence: true, length: { minimum: 11, message: 'is not valid' }
  # alias owner user_id
end
