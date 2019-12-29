# frozen_string_literal: true

json.id patient.id
json.registrant_id patient.registrant_id
json.given_name patient.given_name
json.last_name patient.last_name
json.birthdate patient.birthdate
json.gender patient.gender
json.relationship patient.relationship
json.profile_pic rails_blob_path(patient.profile_pic, only_path: true) if patient.profile_pic.attached?
json.vitals do
  json.partial! 'v1/shared/vital', vital: patient.vitals.recent(patient.id)
end if patient.vitals.size > 0
