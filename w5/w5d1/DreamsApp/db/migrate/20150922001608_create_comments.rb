class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :author_id, null: false, index: true
      t.string :commentable_type, null: false
      t.integer :commentable_id, null: false, index: true
      t.boolean :spooky, null: false

      t.timestamps null: false
    end
  end
end
