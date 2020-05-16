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

require 'rails_helper'

RSpec.describe Medication, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
