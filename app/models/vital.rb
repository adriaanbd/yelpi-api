# frozen_string_literal: true

class Vital < ApplicationRecord
  validates :weight, :systolic, :diastolic,
            :temperature, :mental_condition,
            :physical_health, :locomotive, presence: true

  belongs_to :patient

  delegate :registrant, to: :patient
end
