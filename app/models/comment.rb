# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :phase
  has_many_attached :images
end
