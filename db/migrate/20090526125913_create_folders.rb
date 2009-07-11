class CreateFolders < ActiveRecord::Migration
  def self.up
    create_table :folders do |t|
      t.references :lecture,	:null => true
      t.references :parent,		:null => true
      t.string :name,					:null => false, :limit => 255

      t.timestamps
    end
  end

  def self.down
    drop_table :folders
  end
end
