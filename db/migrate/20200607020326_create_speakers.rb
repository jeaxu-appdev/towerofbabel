class CreateSpeakers < ActiveRecord::Migration[6.0]
  def change
    create_table :speakers do |t|
      t.integer :chat_id
      t.integer :language_id
      t.string :name
      t.integer :speaker_id
      t.integer :user_id

      t.timestamps
    end
  end
end
