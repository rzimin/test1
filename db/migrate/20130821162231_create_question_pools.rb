class CreateQuestionPools < ActiveRecord::Migration
  def change
    create_table :question_pools do |t|
      t.integer :question_id
      t.integer :pool_id

      t.timestamps
    end
  end
end
