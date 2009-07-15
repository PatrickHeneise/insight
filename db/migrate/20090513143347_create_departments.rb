class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.string :title,								:null => false, :limit => 255
      t.text :description
      t.references :organization,			:null => false
			t.string :short,								:null => false, :limit => 5
			t.string :ldap_ou,							:null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :departments
  end
end
