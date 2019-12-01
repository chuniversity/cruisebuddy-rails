class CreateThingWithImages < ActiveRecord::Migration[6.0]
  def change
    create_table :thing_with_images do |t|
      t.string :name

      t.timestamps
    end
  end
end
