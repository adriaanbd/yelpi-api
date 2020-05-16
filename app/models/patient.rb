# frozen_string_literal: true

# == Schema Information
#
# Table name: patients
#
#  id            :uuid             not null, primary key
#  birthdate     :date             not null
#  gender        :string           not null
#  nome          :string           not null
#  profile_pic   :string           default(""), not null
#  relationship  :string           not null
#  sobrenome     :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  registrant_id :uuid             not null
#
# Indexes
#
#  index_patients_on_registrant_id  (registrant_id)
#
# Foreign Keys
#
#  fk_rails_...  (registrant_id => users.id)
#

class Patient < ApplicationRecord
  belongs_to :registrant, class_name: "User"
  has_one_attached :profile_pic

  validates :nome, :sobrenome, :birthdate, :gender, :relationship, presence: true

  has_many :vitals, foreign_key: :patient_id, dependent: :destroy
  has_many :medications, foreign_key: :patient_id,
                         dependent: :destroy
  has_many :observations, dependent: :destroy,
                          foreign_key: :patient_id
  has_many :observers, through: :observations,
                       class_name: "User"
end
