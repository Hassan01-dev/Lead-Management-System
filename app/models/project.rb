# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :lead
  belongs_to :user
end
