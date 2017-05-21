class Event < ApplicationRecord
  include ImageUploader[:image]

  has_many :photos
end
