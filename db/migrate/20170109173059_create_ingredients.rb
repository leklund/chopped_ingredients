class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.text :name, null: false
      t.boolean :appetizer, null: false, default: false
      t.boolean :dessert, null: false, default: false
      t.boolean :entree, null: false, default: false

      t.timestamps
    end
  end
end
