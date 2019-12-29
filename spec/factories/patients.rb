# frozen_string_literal: true

# == Schema Information
#
# Table name: patients
#
#  id            :uuid             not null, primary key
#  registrant_id :uuid             not null
#  given_name    :string           not null
#  last_name     :string           not null
#  birthdate     :date             not null
#  gender        :string           not null
#  profile_pic   :string           default(""), not null
#  relationship  :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


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
