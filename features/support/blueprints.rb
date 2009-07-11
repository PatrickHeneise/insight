require 'forgery'

Sham.login { InternetForgery.user_name }
Sham.password { BasicForgery.password }
Sham.email { InternetForgery.email_address }
Sham.name { NameForgery.full_name }

Organization.blueprint do
	title { Faker::Lorem.sentence }
end

Department.blueprint do
	title { Faker::Lorem.sentence }
	description { Faker::Lorem.paragraphs }
	organization
end

User.blueprint do
	login { Sham.login }
  name { Sham.name }
  email = Sham.email
  email { email }
  pwd = Sham.password
  password { pwd }
  password_confirmation { pwd }
	department
end