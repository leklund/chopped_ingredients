class CreateContestants < ActiveRecord::Migration[5.0]
  def change
    create_table :contestants do |t|
      t.text :name, null: false
      t.text :slug, null: false

      t.timestamps
    end

    add_index :contestants, :slug, unique: true
  end
end
