# frozen_string_literal: true

# == Schema Information
#
# Table name: medications
#
#  id         :uuid             not null, primary key
#  patient_id :uuid             not null
#  name       :string           not null
#  frequency  :string           default(""), not null
#  duration   :string           default(""), not null
#  dosage     :string           default(""), not null
#  time       :time             not null
#  date       :date             not null
#  forma      :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Medication < ApplicationRecord
  validates :name, :frequency, :duration, :dosage,
            :time, :date, :forma, presence: true

  belongs_to :patient
  delegate :registrant, to: :patient
end
