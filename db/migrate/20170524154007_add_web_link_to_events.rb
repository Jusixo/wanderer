class AddWebLinkToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :web_link, :string
  end
end
