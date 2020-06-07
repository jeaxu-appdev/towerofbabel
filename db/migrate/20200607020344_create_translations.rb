class CreateTranslations < ActiveRecord::Migration[6.0]
  def change
    create_table :translations do |t|
      t.text :body
      t.integer :language_id
      t.integer :message_id

      t.timestamps
    end
  end
end
