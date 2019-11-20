class CreatePortImages < ActiveRecord::Migration[6.0]
  def change
    create_table :port_images do |t|
      t.string :url
      t.references :port, null: false, foreign_key: true

      t.timestamps
    end
  end
end
