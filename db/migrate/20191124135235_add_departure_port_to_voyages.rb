class AddDeparturePortToVoyages < ActiveRecord::Migration[6.0]
  def change
    add_column :voyages, :departure_port_id, :integer, default: 1
  end
end
