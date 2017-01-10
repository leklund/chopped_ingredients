class CreateShows < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.text :title, null: false
      t.date :date, null: false
      t.text :notes
      t.string :series_num
      t.integer :season_num
      t.integer :season_id

      t.timestamps
    end
  end
end
