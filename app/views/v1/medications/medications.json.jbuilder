# frozen_string_literal: true

json.medications do
  json.array! medications do |medication|
    json.partial! 'v1/shared/medication', medication: medication
  end
end
