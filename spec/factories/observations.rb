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

FactoryBot.define do
  factory :observation do
    
  end
end
