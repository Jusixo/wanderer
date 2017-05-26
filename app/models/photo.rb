class Photo < ApplicationRecord
  belongs_to :event

  include ImageUploader[:image]

  has_many :favorites, dependent: :destroy
end
