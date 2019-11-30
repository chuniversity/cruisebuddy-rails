class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :ex_email
      t.string :first_name
      t.string :last_name
      t.string :username
      t.references :user, null: true, foreign_key: true
      t.timestamps
    end
  end
end
