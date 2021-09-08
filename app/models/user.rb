# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :phases # rubocop:disable Rails/HasAndBelongsToMany
  has_many :projects # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :leads # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :comments # rubocop:disable Rails/HasManyOrHasOneDependent
end
