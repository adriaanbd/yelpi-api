# frozen_string_literal: true

class Observation < ApplicationRecord
  validates :observer_id, :patient_id, presence: true
  belongs_to :patient
  belongs_to :observer, class_name: 'User'

  delegate :registrant, to: :patient
end
