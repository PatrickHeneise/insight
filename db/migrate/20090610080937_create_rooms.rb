class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.integer :number,								:null => false
      t.references :building,						:null => false
      t.references :user,								:null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
