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


require 'rails_helper'

RSpec.describe Patient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
