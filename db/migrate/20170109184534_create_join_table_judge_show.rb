class CreateJoinTableJudgeShow < ActiveRecord::Migration[5.0]
  def change
    create_join_table :judges, :shows do |t|
      t.index [:show_id, :judge_id]
    end
  end
end
