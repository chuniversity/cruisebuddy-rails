class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.string :name
      t.references :cruise_line, null: false, foreign_key: true

      t.timestamps
    end
  end
end
