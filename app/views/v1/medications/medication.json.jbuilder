# frozen_string_literal: true

json.medication do
  json.partial! 'v1/shared/medication', medication: medication
end
