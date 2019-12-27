# frozen_string_literal: true

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
