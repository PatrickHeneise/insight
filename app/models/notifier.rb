class Notifier < ActionMailer::Base
  def welcome_email(user, pw)
     recipients user.email
     from       "insight@hs-furtwangen.de"
     subject    "insight account information"
 		 sent_on		Time.now
     body       :user => user, :password => pw
		 content_type  "text/html"
   end
	 
	def system_registration(user)
		recipients "sternh@hs-furtwangen.de"
		from       "insight@hs-furtwangen.de"
		subject    "new insight account"
		sent_on			Time.now
		body				:user => user
	end
end