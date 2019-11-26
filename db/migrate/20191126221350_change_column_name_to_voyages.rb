class ChangeColumnNameToVoyages < ActiveRecord::Migration[6.0]
  def change
    rename_column :voyages, :departure_port_id, :departure_port
  end
end
