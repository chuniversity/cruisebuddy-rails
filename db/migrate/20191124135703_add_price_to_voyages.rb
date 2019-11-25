class AddPriceToVoyages < ActiveRecord::Migration[6.0]
  def change
    add_column :voyages, :price, :integer
  end
end
