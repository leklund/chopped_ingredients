class CreateContestants < ActiveRecord::Migration[5.0]
  def change
    create_table :contestants do |t|
      t.text :name
      t.text :description
      t.integer :show_id
      t.integer :placing

      t.timestamps
    end
  end
end
