class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street,									:null => false, :limit => 255
      t.string :street_addition
      t.string :city,										:null => false, :limit => 255
      t.string :postcode,								:null => false, :limit => 15
      t.string :state
      t.string :country,								:null => false, :limit => 255
			t.references :user,								:null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
