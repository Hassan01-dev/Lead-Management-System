# frozen_string_literal: true

class Phase < ApplicationRecord
  # serialize :assigned_engineer, Array
  belongs_to :user
  belongs_to :lead
  has_many :comments, dependent: :destroy

  validates :phase_type, presence: true
  validate :check_validation

  # after_create :confirmation_mail_create
  # after_update :confirmation_mail_update
  # after_destroy :confirmation_mail_destroy

  private

  # def confirmation_mail_create
  #   PhaseMailer.with(phase: @phase, admin: current_user).phase_created.deliver_later
  #   PhaseMailer.with(phase: @phase, admin: current_user).phase_assigned_TM.deliver_later
  #   flash[:success] = 'Phase Created Successfully.'

    # PhaseExpireMailJob.set(wait: (@Phase.end_daye - Date.current).day).perform_later(@phase)
  # end

  # def confirmation_mail_update
  #   PhaseMailer.with(phase: @phase, admin: current_user).phase_update.deliver_later
  #   flash[:notice] = 'Phase Updated Successfully.'
  # end

  # def confirmation_mail_destroy
  #   PhaseMailer.with(phase: @phase, admin: current_user).phase_deleted.deliver_later
  #   flash[:alert] = 'Phase Deleted Successfully.'
  # end

  def check_validation # rubocop:disable Metrics/AbcSize
    errors[:base] << 'Start Date must not be in past' if id.nil? && (start_date - Date.current).to_i.negative?
    errors[:base] << 'End Date must be greater then Start date' if (end_date - start_date).to_i.negative?
  end
end
