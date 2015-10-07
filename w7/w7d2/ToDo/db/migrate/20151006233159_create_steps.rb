class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :todo_id, null: false, index: true
      t.text :stepbody, null: false
      t.integer :step_number, null: false

      t.timestamps null: false
    end
  end
end
