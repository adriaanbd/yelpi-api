# frozen_string_literal: true

# == Schema Information
#
# Table name: patients
#
#  id            :uuid             not null, primary key
#  registrant_id :uuid             not null
#  given_name    :string           not null
#  last_name     :string           not null
#  birthdate     :date             not null
#  gender        :string           not null
#  profile_pic   :string           default(""), not null
#  relationship  :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


class Patient < ApplicationRecord
  belongs_to :registrant, class_name: 'User'
  has_one_attached :profile_pic

  validates :given_name, :last_name, :birthdate, :gender, :relationship, presence: true

  has_many :vitals, foreign_key: :patient_id, dependent: :destroy
  has_many :medications, foreign_key: :patient_id,
                         dependent: :destroy
  has_many :observations, dependent: :destroy,
                          foreign_key: :patient_id
  has_many :observers, through: :observations,
                       class_name: 'User'
end
