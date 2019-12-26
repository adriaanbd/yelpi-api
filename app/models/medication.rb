# frozen_string_literal: true

class Medication < ApplicationRecord
  validates :name, :frequency, :duration, :dosage,
            :time, :date, :forma, presence: true

  belongs_to :patient
  delegate :registrant, to: :patient
end
