# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :leads # rubocop:disable Rails/HasManyOrHasOneDependent
end
