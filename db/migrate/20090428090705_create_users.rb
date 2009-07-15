class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login,							:limit => 50, :null => false
			t.string :name,								:limit => 255
			t.string :surname,						:limit => 255
			t.string :title,							:limit => 15, :null => true;
      t.string :crypted_password,		:null => false
      t.string :persistence_token,	:null => false
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.datetime :last_request_at
      t.string :last_login_ip
      t.string :current_login_ip
      t.string :email,							:limit => 255, :null => false
      t.string :private_email,			:limit => 255
      t.integer :icq,								:limit => 15
      t.string :phone
      t.text :activities
      t.text :publications
      t.text :presentations
      t.text :biography
      t.references :company
      t.references :department
      t.references :address
      t.references :home_address
			t.references :course
			t.integer :semester,					:null => true, :limit => 2
			t.boolean :active,						:default => false, :null => false
			t.string :ldap_dn

      t.timestamps
    end
		add_index :users, :login
		add_index :users, :name
		add_index :users, :surname
  end

  def self.down
    drop_table :users
  end
end
