class CreateJudges < ActiveRecord::Migration[5.0]
  def change
    create_table :judges do |t|
      t.text :name

      t.timestamps
    end
  end
end
