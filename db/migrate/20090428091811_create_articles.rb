class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title,								:null => false, :limit => 255
      t.text :content,								:null => false
      t.references :user,							:null => false
      t.references :blog,							:null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
