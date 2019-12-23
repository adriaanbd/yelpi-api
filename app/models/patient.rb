# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :registrant, class_name: 'User'
  has_one_attached :profile_pic

  validates :given_name, :last_name, :birthdate, :gender, :relationship, presence: true

  has_many :vitals, foreign_key: :patient_id, dependent: :destroy
end
