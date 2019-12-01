class CreateVoyages < ActiveRecord::Migration[6.0]
  def change
    create_table :voyages do |t|
      t.text :description
      t.date :departure_date
      t.date :arrival_date
      t.integer :duration
      t.timestamps
    end
  end
end
