class AddCompletedColumnToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :completeness, :integer, default: 0
  end
end
