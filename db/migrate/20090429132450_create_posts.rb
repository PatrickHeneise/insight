class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text :content,								:null => false
      t.references :user,							:null => false
      t.references :topic,						:null => false
			t.references :editor,						:null => true

      t.timestamps
    end
	  add_index "posts", ["user_id", "created_at"], :name => "index_posts_on_user_id"
	  add_index "posts", ["topic_id", "created_at"], :name => "index_posts_on_topic_id"
		
		add_column :users, :last_seen_at, :datetime
  end

  def self.down
    drop_table :posts
  end
end
