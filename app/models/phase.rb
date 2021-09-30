# frozen_string_literal: true

class Phase < ApplicationRecord
  # serialize :assigned_engineer, Array
  belongs_to :user
  belongs_to :lead
  has_many :comments, dependent: :destroy

  validates :phase_type, presence: true
  validate :correct_date

  after_create :set_background_job_for_expiry_mail

  def assigned_engineer?(user)
    assigned_engineer&.include? user.id.to_s
  end

  private

  def set_background_job_for_expiry_mail
    PhaseExpireMailJob.set(wait: (end_date - Date.current).days).perform_later(self)
  end

  def correct_date # rubocop:disable Metrics/AbcSize
    errors[:base] << I18n.t('phases.errors.start_date') if id.nil? && (start_date - Date.current).to_i.negative?
    errors[:base] << I18n.t('phases.errors.end_date') if (end_date - start_date).to_i.negative?
  end
end
