class AddEventInfoToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_info, :string
  end
end
