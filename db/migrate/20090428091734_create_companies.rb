class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name,								:null => false, :limit => 255
      t.references :address,				:null => false
      t.string :industry
			t.string :url,								:limit => 255
			
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
