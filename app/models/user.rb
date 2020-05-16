# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  given_name             :string           not null
#  last_name              :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#


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
