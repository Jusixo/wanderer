class AddPhotosRefToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :photo, foreign_key: true
  end
end
