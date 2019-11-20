class CreateItineraries < ActiveRecord::Migration[6.0]
  def change
    create_table :itineraries do |t|
      t.string :name
      t.references :ship, null: false, foreign_key: true
      t.references :voyage_port, null: false, foreign_key: true

      t.timestamps
    end
  end
end
