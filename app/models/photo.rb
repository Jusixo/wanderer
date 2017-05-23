class Photo < ApplicationRecord
  belongs_to :event

  include ImageUploader[:image]
end
