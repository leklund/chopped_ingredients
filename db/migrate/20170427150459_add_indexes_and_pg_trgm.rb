class AddIndexesAndPgTrgm < ActiveRecord::Migration[5.1]
  def up
    add_index :ingredients, :name

    execute <<-SQL
      CREATE EXTENSION IF NOT EXISTS pg_trgm;

      CREATE INDEX index_ingredients_on_name_trigram
        ON ingredients
        USING gin (name gin_trgm_ops);
    SQL
  end

  def down
    remove_index :ingredients, :name

    execute <<-SQL
      DROP INDEX index_ingredients_on_name_trigram;
    SQL
  end
end
