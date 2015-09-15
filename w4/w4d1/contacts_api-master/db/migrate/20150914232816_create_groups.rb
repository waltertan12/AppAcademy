class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
    add_index :groups, [:user_id, :name], unique: true
  end
end
