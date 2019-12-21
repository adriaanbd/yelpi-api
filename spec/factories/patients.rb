# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    registrant_id { '' }
    given_name { 'MyString' }
    last_name { 'MyString' }
    birthdate { '2019-12-14' }
    gender { 'MyString' }
    relationship { 'MyString' }
  end
end
