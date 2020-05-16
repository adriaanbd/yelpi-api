# frozen_string_literal: true

# == Schema Information
#
# Table name: patients
#
#  id            :uuid             not null, primary key
#  birthdate     :date             not null
#  gender        :string           not null
#  nome          :string           not null
#  profile_pic   :string           default(""), not null
#  relationship  :string           not null
#  sobre_nome    :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  registrant_id :uuid             not null
#
# Indexes
#
#  index_patients_on_registrant_id  (registrant_id)
#
# Foreign Keys
#
#  fk_rails_...  (registrant_id => users.id)
#


require 'rails_helper'

RSpec.describe Patient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
