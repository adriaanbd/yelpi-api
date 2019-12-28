# frozen_string_literal: true

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
