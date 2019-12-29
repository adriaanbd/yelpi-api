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

require 'rails_helper'

RSpec.describe Medication, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
