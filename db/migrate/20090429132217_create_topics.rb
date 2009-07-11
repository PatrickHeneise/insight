class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title,								:null => false, :limit => 255
      t.references :forum,						:null => false
      t.references :user,							:null => false
			t.boolean :sticky,							:default => false
			t.datetime :replied_at
			t.boolean :locked,							:default => false
			t.integer :hits,								:default => 0

      t.timestamps
    end
		add_index "topics", ["forum_id"], :name => "index_topics_on_forum_id"
	  add_index "topics", ["forum_id", "sticky", "replied_at"], :name => "index_topics_on_sticky_and_replied_at"
	  add_index "topics", ["forum_id", "replied_at"], :name => "index_topics_on_forum_id_and_replied_at"	
  end

  def self.down
    drop_table :topics
  end
end
