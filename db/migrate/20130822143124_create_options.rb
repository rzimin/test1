class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id
      t.text :text
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
