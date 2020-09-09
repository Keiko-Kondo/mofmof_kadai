class NearestStation < ApplicationRecord
  belongs_to :house, optional: true
end
