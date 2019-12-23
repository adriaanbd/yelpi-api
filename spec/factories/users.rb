# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    given_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'test123' }
  end
end
