class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.text :name, null: false
      t.text :slug, null: false
      t.string :number
      t.integer :sort

      t.timestamps
    end

    add_index :seasons, :slug, unique: true
  end
end
