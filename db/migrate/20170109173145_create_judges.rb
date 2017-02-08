class CreateJudges < ActiveRecord::Migration[5.0]
  def change
    create_table :judges do |t|
      t.text :name, null: false
      t.text :slug, null: false

      t.timestamps
    end

    add_index :judges, :slug, unique: true
  end
end
