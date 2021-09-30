# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :projects # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :leads # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :comments, dependent: :nullify

  after_create :add_role_to_user
  validates :user_name, presence: true
  validates :email, presence: true
  validates :user_role, presence: true

  private

  def add_role_to_user
    case user_role
    when 'admin'
      add_admin_role

    when 'BD'
      add_bd_role

    when 'TM'
      add_tm_role
    end
    add_engineer_role
  end

  def add_admin_role
    add_role :admin
    add_bd_role
  end

  def add_bd_role
    add_role :BD
    add_tm_role
  end

  def add_tm_role
    add_role :TM
    add_engineer_role
  end

  def add_engineer_role
    add_role :engineer
  end
end
