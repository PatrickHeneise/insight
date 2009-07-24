class User < ActiveRecord::Base
	acts_as_authentic
	validate

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
	has_many :jobs
	has_many :addresses
	
	def role_symbols
     (roles || []).map {|r| r.title.to_sym}
	end
	
	# Paperclip
	has_attached_file :avatar, :styles => { :original => "300x300", :large => "150x150", :medium => "100x100>", :small => "50x50>" }, :url => "/avatars/:login/:style/:login.:extension"
	validates_attachment_size :avatar, :less_than => 500.kilobytes
	validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

	def fullname
		if(self.title)
			return "#{title} #{name} #{surname}"
		else
			return "#{name} #{surname}"
		end
	end
	
	def list_roles
		(roles || []).map { |r| I18n.translate('roles.' + r.title.downcase) }.join('<br />')
	end
	
	def list_roles_detail
		list = ""
		roles.each_with_index do |r,i|
			list += I18n.translate('roles.' + r.title.downcase) + " #{course.short} #{semester}" if(r.title == "Student")
			list += I18n.translate('roles.' + r.title.downcase) + " #{department.short.upcase}" if(r.title == "Developer")
			list += I18n.translate('roles.' + r.title.downcase) + " #{department.short.upcase}" if(r.title == "Employee")
			if(i < roles.size-1)
				list += "<br />"
			end
		end
		return list
	end
	
	def enrolled?(id)
		lecture = enrollments.find_by_lecture_id id
		return !lecture.nil?
	end
	
	private
		def validate
			if department_is_needed?
				if self.department.blank?
					errors.clear
					errors.add(:department_id, 'Please choose a department' )
				end
			end
		end
	 
		def department_is_needed?
			result = false
			result = true if self.active?
		end
		
		named_scope :inactive, :conditions => { :active => false }
end