class CreateTagTopics < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.string :tag_topic, null: false

      t.timestamps null: false
    end
  end
end
