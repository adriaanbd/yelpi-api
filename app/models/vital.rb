<<<<<<< HEAD
# frozen_string_literal: true

class Vital < ApplicationRecord
  validates :weight, :systolic, :diastolic,
            :temperature, :mental_condition,
            :physical_health, :locomotive, presence: true

  belongs_to :patient
=======
class Vital < ApplicationRecord
>>>>>>> 15f05c7a59dcdac72a89af35e2b80dba6dd028e0
end
