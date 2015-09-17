class AddBrowserEnvToUserSessions < ActiveRecord::Migration
  def change
    add_column :user_sessions, :browser_type, :string 
  end
end
