class Event < ApplicationRecord
  include ImageUploader[:image]

  has_many :photos
  accepts_nested_attributes_for :photos
end
