class CreateLectures < ActiveRecord::Migration
  def self.up
    create_table :lectures do |t|
      t.references :department,				:null => false
      t.string :title,								:null => false, :limit => 255
      t.string :short,								:limit => 5, :null => false
      t.text :description
      t.boolean :visible
      t.boolean :active
      t.integer :credits
      t.integer :number

      t.timestamps
    end
  end

  def self.down
    drop_table :lectures
  end
end
