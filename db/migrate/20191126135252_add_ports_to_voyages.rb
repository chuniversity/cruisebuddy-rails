class AddPortsToVoyages < ActiveRecord::Migration[6.0]
  def change
    add_column :voyages, :ports, :text
  end
end
