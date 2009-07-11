class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.references :bullet,						:null => false
      t.text :content,								:null => false
      t.references :user,							:null => false
			t.references :editor,						:null => true

      t.timestamps
    end
	  add_index "replies", ["user_id", "created_at"], :name => "index_reply_on_user_id"
	  add_index "replies", ["bullet_id", "created_at"], :name => "index_reply_on_bullet_id"
  end

  def self.down
    drop_table :replies
  end
end
