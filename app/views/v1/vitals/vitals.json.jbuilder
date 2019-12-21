json.vitals do
  json.array! vitals do |vital|
    json.partial! 'v1/shared/vital', vital: vital
  end
end
