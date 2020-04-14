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

FactoryBot.define do
  factory :medication do
    patient_id { "" }
    name { "MyString" }
    frequency { "MyString" }
    duration { "MyString" }
    dosage { "MyString" }
    time { "2019-12-26 10:36:00" }
    date { "2019-12-26" }
    forma { "MyString" }
  end
end
