class AddShipIdToVoyages < ActiveRecord::Migration[6.0]
  def change
    add_reference :voyages, :ship, index: true
  end
end