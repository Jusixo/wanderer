class AddEventToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_reference :photos, :event, foreign_key: true
  end
end
