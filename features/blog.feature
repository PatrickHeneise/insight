Feature Blog:
	As a logged in user
	I want to view, write, edit and delete blog articles
	depending on my authorization level
	
	Scenario: Go to the Blog
		Given a user "patrick"
		When I go to the start page
		When I follow "Blog"
		Then I am on the blog page