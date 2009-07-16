require 'net/ldap'
module LDAP
	
	def self.register(login,password,base)
		ldap = Net::LDAP.new :host => 'ldap.hs-furtwangen.de'
		ldap.open do |ldap|
			ldap.authenticate("uid=#{login},#{base}", password)
			ldap.bind
			filter = Net::LDAP::Filter.eq("uid", "#{login}")
			attrs = ["sn", "givenName", "hfuCurrentSemester", "hfuStudycourse", "mail", "mailPrivat", "hfuRegId", "hfuTitle", "eduPersonAffiliation"]
			entries = ldap.search(:base => "#{base}", :attributes => attrs, :filter => filter)
			return entries
		end
	end
end