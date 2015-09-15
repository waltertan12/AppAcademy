class AddFavoriteFeatureToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :favorite, :boolean, default: false, null: false
  end
end
