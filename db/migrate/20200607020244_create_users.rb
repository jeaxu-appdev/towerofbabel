class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :default_guest_language_id
      t.string :email
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
