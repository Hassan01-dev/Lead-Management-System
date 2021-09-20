# frozen_string_literal: true

class PhaseExpireMailJob < ApplicationJob
  queue_as :default

  def perform(phase)
    PhaseExpiredMailer.with(phase: phase).phase_expired.deliver_later
  end
end
