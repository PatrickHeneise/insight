class CreateCourseModulesLectures < ActiveRecord::Migration
  def self.up
		create_table :course_modules_lectures, :id => false do |t|
      t.references :lecture,					:null => false
			t.references :course_module,		:null => false
    end

  end

  def self.down
		drop_table :roles_users
  end
end
