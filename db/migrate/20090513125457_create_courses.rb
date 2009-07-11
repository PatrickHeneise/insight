class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :title,								:null => false, :limit => 255
      t.string :short,								:limit => 5, :null => false
      t.references :department

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
