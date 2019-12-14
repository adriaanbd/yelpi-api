class Patient < ApplicationRecord
  belongs_to :registrant, class_name: 'User'
end
