class Event < ApplicationRecord
  belongs_to :admin

  has_many :photos, dependent: :destroy
end
