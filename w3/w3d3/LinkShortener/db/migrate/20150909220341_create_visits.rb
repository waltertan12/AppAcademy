class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.timestamps
      t.integer :user_id, null: false
      t.integer :short_url_id, null: false
    end
    add_index :visits, :user_id
    add_index :visits, :short_url_id
  end
end
