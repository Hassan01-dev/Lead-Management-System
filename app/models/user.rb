# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :phases # rubocop:disable Rails/HasAndBelongsToMany
  has_many :projects # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :leads # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :comments # rubocop:disable Rails/HasManyOrHasOneDependent
end
