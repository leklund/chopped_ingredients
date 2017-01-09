class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.text :name
      t.string :number

      t.timestamps
    end
  end
end
