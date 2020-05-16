# == Schema Information
#
# Table name: medications
#
#  id         :uuid             not null, primary key
#  date       :date             not null
#  dosage     :string           default(""), not null
#  duration   :string           default(""), not null
#  forma      :string           default(""), not null
#  frequency  :string           default(""), not null
#  name       :string           not null
#  time       :time             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  patient_id :uuid             not null
#
# Indexes
#
#  index_medications_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
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
