# frozen_string_literal: true

class Phase < ApplicationRecord
  # serialize :assigned_engineer, Array
  belongs_to :user
  belongs_to :lead
  has_many :comments, dependent: :destroy

  validates :phase_type, presence: true
  validate :check_validation

  private

  def check_validation # rubocop:disable Metrics/AbcSize
    errors[:base] << 'Start Date must not be in past' if id.nil? && (start_date - Date.current).to_i.negative?
    errors[:base] << 'End Date must be greater then Start date' if (end_date - start_date).to_i.negative?
  end
end
