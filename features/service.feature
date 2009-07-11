Feature Service:
	As a logged in user
	I want to know what services are offered from the university
	
	Scenario: Go to Service
		Given a user "patrick"
		When I go to the start page
		When I follow "Service"
		Then I am on the service page