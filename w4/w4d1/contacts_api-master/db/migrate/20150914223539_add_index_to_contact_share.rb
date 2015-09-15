class AddIndexToContactShare < ActiveRecord::Migration
  def change
    add_index :contact_shares, [:contact_id, :user_id], unique: true
  end
end
