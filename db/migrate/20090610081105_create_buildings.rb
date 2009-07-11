class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings do |t|
      t.string :code,								:null => false, :limit => 3
      t.references :address,				:null => false
      t.references :organization,		:null => false
      t.time :open_from
      t.time :open_to
      t.text :info

      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end
