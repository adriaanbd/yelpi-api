# frozen_string_literal: true

# == Schema Information
#
# Table name: vitals
#
#  id               :uuid             not null, primary key
#  patient_id       :uuid             not null
#  weight           :float            default(0.0), not null
#  systolic         :float            default(0.0), not null
#  diastolic        :float            default(0.0), not null
#  temperature      :float            default(0.0), not null
#  mental_condition :integer          default(0), not null
#  physical_health  :integer          default(0), not null
#  locomotive       :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#


require 'rails_helper'

RSpec.describe Vital, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
