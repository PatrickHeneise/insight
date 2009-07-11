class CreateEnrollments < ActiveRecord::Migration
  def self.up
    create_table :enrollments do |t|
      t.references :user,								:null => false
      t.references :lecture,						:null => false
      t.datetime :due

      t.timestamps
    end
  end

  def self.down
    drop_table :enrollments
  end
end
