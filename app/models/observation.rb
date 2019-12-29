# frozen_string_literal: true

# == Schema Information
#
# Table name: observations
#
#  id          :uuid             not null, primary key
#  observer_id :uuid             not null
#  patient_id  :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class Observation < ApplicationRecord
  validates :observer_id, :patient_id, presence: true
  belongs_to :patient
  belongs_to :observer, class_name: 'User'

  delegate :registrant, to: :patient
end
