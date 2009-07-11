Before do
  User.delete_all
end
 
Given /^a user "([^\"]*)" with the passwort "([^\"]*)"$/ do |login, password|
  User.make :login => login, :password => password, :password_confirmation => password
end

Given /a user "([^\"]*)"$/ do |login|
  User.make :login => login
end

Then /^I should see a login form$/ do
  response.should contain("Login")
  response.should contain("Password")
  response.should contain("Remember me")
end

Given /^an anonymous user$/ do
	visit "/"
end

Then /^I should be logged in$/ do
end

Then /^I should not be logged in$/ do
  response.should contain("Fehler")
end