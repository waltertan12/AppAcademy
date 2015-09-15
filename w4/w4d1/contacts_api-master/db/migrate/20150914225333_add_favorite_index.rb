class AddFavoriteIndex < ActiveRecord::Migration
  def change
    add_index :contacts, :favorite
  end
end
