class ChangeDeparturePortIdToBeStringInVoyages < ActiveRecord::Migration[6.0]
  def change
    change_column :voyages, :departure_port_id, :string
  end
end
