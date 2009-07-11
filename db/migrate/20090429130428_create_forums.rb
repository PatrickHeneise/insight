class CreateForums < ActiveRecord::Migration
  def self.up
    create_table :forums do |t|
      t.string :title,								:null => false, :limit => 255
			t.text :description
			t.integer :position
      t.references :department,				:null => true
			t.boolean :internal,						:default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :forums
  end
end
