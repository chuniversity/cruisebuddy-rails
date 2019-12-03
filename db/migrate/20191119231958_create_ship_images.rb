class CreateShipImages < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_images do |t|
      t.string :url
      t.references :ship, null: false, foreign_key: true
      t.references :review, null: true, foreign_key: true
      t.timestamps
    end
  end
end
