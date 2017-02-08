class CreateContestantsShows < ActiveRecord::Migration[5.0]
  def change
    create_join_table :contestants, :shows do |t|
      t.string :description
      t.integer :placing
      t.index [:show_id, :contestant_id]
    end
  end
end
