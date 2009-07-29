# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def display_flashes
		return if flash.blank?
		flash_type = flash.keys.first.to_sym
			
		return content_tag(:div, :id => "flash_box", :class => "flash-wrapper") do
			content_tag(:div, "<p class=\"#{flash_type}\">#{flash[flash_type]}</p>", :class => "span-24 last")
		end
	end
end
