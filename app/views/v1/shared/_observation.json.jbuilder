# frozen_string_literal: true

json.id observation.id
json.observer_id observation.observer_id
json.patient do
  json.partial! 'v1/shared/patient', patient: observation.patient
end
