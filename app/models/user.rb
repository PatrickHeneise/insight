class User < ActiveRecord::Base
	acts_as_authentic
	
  belongs_to :company
  belongs_to :department
  belongs_to :address
  belongs_to :home_address, :class_name => "address"
	belongs_to :course
	
	has_and_belongs_to_many :roles
	has_many :articles
	has_many :comments
	has_many :subscriptions
	has_many :forums, :through => :subscriptions
	has_many :topics
	has_many :posts
	has_many :enrollments
	has_many :lectures, :through => :enrollments
	has_many :data_items
	has_many :bullet_activities
	has_many :topic_activities
	
	def role_symbols
     (roles || []).map {|r| r.title.to_sym}
	end
	
	def enrolled?(id)
		lecture = enrollments.find_by_lecture_id id
		return !lecture.nil?
	end
	
	def fullname
		return self.title + " " + self.name + " " + self.surname rescue return self.name + " " + self.surname
	end
	
	def status
		roles.each do |r|
			if(r.title == "Student")
				return course.short.to_s + " " + semester.to_s
			elsif(r.title == "Developer")
				return I18n.translate('employee') + " " + department.short
			elsif(r.title == "Professor")
				return I18n.translate('professor') + " " + department.short
			end
		end
	end
	 
	# Paperclip
	has_attached_file :avatar, :styles => { :original => "300x300", :large => "150x150", :medium => "100x100>", :small => "50x50>" }, :url => "/avatars/:login/:style/:login.:extension"
	validates_attachment_size :avatar, :less_than => 500.kilobytes
	validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
end