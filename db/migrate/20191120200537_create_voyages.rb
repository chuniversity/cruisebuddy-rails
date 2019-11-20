class CreateVoyages < ActiveRecord::Migration[6.0]
  def change
    create_table :voyages do |t|
      t.datetime :start
      t.datetime :end
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
