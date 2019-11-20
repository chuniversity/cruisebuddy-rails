class CreateVoyagePorts < ActiveRecord::Migration[6.0]
  def change
    create_table :voyage_ports do |t|
      t.references :port, null: false, foreign_key: true
      t.references :voyage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
