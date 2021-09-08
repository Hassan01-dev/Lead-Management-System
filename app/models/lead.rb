# frozen_string_literal: true

class Lead < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_one :project # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :phases # rubocop:disable Rails/HasManyOrHasOneDependent
end
