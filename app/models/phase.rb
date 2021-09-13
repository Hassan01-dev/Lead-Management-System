# frozen_string_literal: true

class Phase < ApplicationRecord
  # serialize :assigned_engineer, Array
  belongs_to :user
  belongs_to :lead
  has_and_belongs_to_many :users # rubocop:disable Rails/HasAndBelongsToMany
  has_many :comments # rubocop:disable Rails/HasManyOrHasOneDependent
end
