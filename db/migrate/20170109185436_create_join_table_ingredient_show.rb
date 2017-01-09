class CreateJoinTableIngredientShow < ActiveRecord::Migration[5.0]
  def change
    create_join_table :ingredients, :shows do |t|
      t.string :round
      t.index [:show_id, :ingredient_id]
    end
  end
end
