class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.date :at_date
      t.time :at_time
			t.string :title,						:limit => 255, :null => false
      t.date :to_date,						:null => false
      t.time :to_time,						:null => true
      t.integer :from_block,			:null => true
      t.integer :to_block,				:null => true
      t.string :repeatFrequency,	:null => true
      t.integer :repeatInterval,	:null => true
      t.references :lecture,			:null => true
      t.references :room,					:null => true
			t.boolean :is_lecture,			:null => false
      t.boolean :is_blocked,			:null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
