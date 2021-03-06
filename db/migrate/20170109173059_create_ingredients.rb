class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.text :name, null: false
      t.text :slug, null: false
      t.boolean :appetizer, null: false, default: false
      t.boolean :dessert, null: false, default: false
      t.boolean :entree, null: false, default: false

      t.timestamps
    end

    add_index :ingredients, :slug, unique: true
  end
end
