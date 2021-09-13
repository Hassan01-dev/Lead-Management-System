# frozen_string_literal: true

class Lead < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_one :project # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :phases # rubocop:disable Rails/HasManyOrHasOneDependent

  after_destroy :delete_respective_client

  private

  def delete_respective_client
    client.delete
  end
  # alias owner user_id
end
