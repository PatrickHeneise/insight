class CreateBullets < ActiveRecord::Migration
  def self.up
    create_table :bullets do |t|
      t.references :board,						:null => false
      t.string :title,								:limit => 255,	:null => false
			t.text :content,								:null => false
      t.references :user,							:null => false
			t.datetime :replied_at
			t.boolean :locked,							:default => false

      t.timestamps
    end
		add_index "bullets", ["board_id"], :name => "index_bullets_on_board_id"
	  add_index "bullets", ["board_id", "replied_at"], :name => "index_bullets_on_board_id_and_replied_at"	
  end

  def self.down
    drop_table :bullets
  end
end
