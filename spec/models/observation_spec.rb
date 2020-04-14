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

require 'rails_helper'

RSpec.describe Observation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
