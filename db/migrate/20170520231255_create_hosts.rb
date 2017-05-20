class CreateHosts < ActiveRecord::Migration[5.1]
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :web_link
      t.string :market_info

      t.timestamps
    end
  end
end
