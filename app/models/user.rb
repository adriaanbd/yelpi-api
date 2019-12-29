# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  given_name             :string           not null
#  last_name              :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
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
