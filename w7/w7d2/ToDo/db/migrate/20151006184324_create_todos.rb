class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :done, null: false, default: false 
      t.timestamps null: false
    end
  end
end
