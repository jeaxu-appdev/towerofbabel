class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :code
      t.string :name_in_english

      t.timestamps
    end
  end
end
