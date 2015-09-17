class Createmultiplesessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.integer :user_id, null: false
      t.string :session_token, null: false

      t.timestamps
    end

    add_index :user_sessions, :user_id
  end
end
