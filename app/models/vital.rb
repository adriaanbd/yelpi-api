# frozen_string_literal: true

# == Schema Information
#
# Table name: vitals
#
#  id               :uuid             not null, primary key
#  diastolic        :float            default(0.0), not null
#  locomotive       :integer          default(0), not null
#  mental_condition :integer          default(0), not null
#  physical_health  :integer          default(0), not null
#  systolic         :float            default(0.0), not null
#  temperature      :float            default(0.0), not null
#  weight           :float            default(0.0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  patient_id       :uuid             not null
#
# Indexes
#
#  index_vitals_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#


class Vital < ApplicationRecord
  validates :weight, :systolic, :diastolic,
            :temperature, :mental_condition,
            :physical_health, :locomotive, presence: true

  belongs_to :patient

  delegate :registrant, to: :patient
  scope :order_created, -> { order(created_at: :asc) }

  def self.recent(patient_id)
    order_created.where('patient_id = ?', patient_id).last
  end
end
