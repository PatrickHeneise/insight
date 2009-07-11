class CreateDataItems < ActiveRecord::Migration
  def self.up
    create_table :data_items do |t|
      t.references :folder,								:null => false
      t.string :upload_file_name,					:null => false, :limit => 255
      t.string :upload_content_type
      t.integer :upload_file_size
      t.datetime :upload_updated_at
      t.references :user,									:null => false
      t.string :state,										:null => false, :limit => 10

      t.timestamps
    end
  end

  def self.down
    drop_table :data_items
  end
end
