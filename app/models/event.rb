class Event < ApplicationRecord
  belongs_to :admin

  include ImageUploader[:image]

  has_many :photos, dependent: :destroy
end
