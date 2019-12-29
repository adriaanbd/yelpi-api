# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save { [given_name.downcase!, last_name.downcase!] }
  validates :given_name, presence: true
  validates :last_name, presence: true
  validates_confirmation_of :password

  has_many :patients, foreign_key: :registrant_id,
                      dependent: :destroy
  has_many :observations, dependent: :destroy,
                          foreign_key: :observer_id
  has_many :observed_patients, through: :observations,
                               source: :patient
end
