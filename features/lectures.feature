Feature Lectures:
	As a logged in user
	I want to see booked lectures and important information from those lectures. 
	I can book and remove lectures.
	
	Scenario: Go to Lectures
		Given a user "patrick"
		When I go to the start page
		When I follow "Lectures"
		Then I am on the lectures page