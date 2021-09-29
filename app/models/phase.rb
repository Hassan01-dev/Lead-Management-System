# frozen_string_literal: true

class Phase < ApplicationRecord
  # serialize :assigned_engineer, Array
  belongs_to :user
  belongs_to :lead
  has_many :comments, dependent: :destroy

  validates :phase_type, presence: true
  validate :correct_date

  def assigned_engineer?(user)
    assigned_engineer&.include? user.id.to_s
  end

  private

  def correct_date # rubocop:disable Metrics/AbcSize
    errors[:base] << 'Start Date must not be in past' if id.nil? && (start_date - Date.current).to_i.negative?
    errors[:base] << 'End Date must be greater then Start date' if (end_date - start_date).to_i.negative?
  end
end
