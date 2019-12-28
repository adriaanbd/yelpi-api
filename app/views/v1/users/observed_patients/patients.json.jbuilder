json.patients do
  json.array! patients do |patient|
    json.partial! 'v1/shared/patient', patient: patient
  end
end