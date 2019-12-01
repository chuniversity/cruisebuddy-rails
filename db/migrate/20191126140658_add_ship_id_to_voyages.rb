class AddShipIdToVoyages < ActiveRecord::Migration[6.0]
  def change
    add_column :voyages, :ship_id, :integer
  end
end
