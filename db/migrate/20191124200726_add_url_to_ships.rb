class AddUrlToShips < ActiveRecord::Migration[6.0]
  def change
    add_column :ships, :url, :string
  end
end
