# frozen_string_literal: true

json.id patient.id
json.registrant_id patient.registrant_id
json.nome patient.nome
json.sobre_nome patient.sobre_nome
json.birthdate patient.birthdate
json.gender patient.gender
json.relationship patient.relationship
json.profile_pic rails_blob_path(patient.profile_pic, only_path: true) if patient.profile_pic.attached?
unless patient.vitals.empty?
  json.vitals do
    json.partial! "v1/shared/vital", vital: patient.vitals.recent(patient.id)
  end
end
