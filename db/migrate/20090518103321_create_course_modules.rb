class CreateCourseModules < ActiveRecord::Migration
  def self.up
    create_table :course_modules do |t|
      t.string :title,								:null => false, :limit => 255
      t.string :short,								:null => false, :limit => 5
      t.boolean :visible
      t.integer :level
      t.text :description
      t.references :course
      t.integer :semester,						:null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :course_modules
  end
end
