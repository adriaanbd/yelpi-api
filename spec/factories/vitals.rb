# frozen_string_literal: true

FactoryBot.define do
  factory :vital do
    patient_id { '' }
    weight { 1.5 }
    temperature { 1.5 }
    mental_condition { '' }
    physical_health { '' }
    locomotive { '' }
  end
end
