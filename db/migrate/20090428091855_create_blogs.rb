class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :title,								:null => false, :limit => 255
      t.references :department,				:null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
