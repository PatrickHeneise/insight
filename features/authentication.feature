Feature: Authentication
  As an anonymous user
  I want to login to the application
  So that I can be productive

  Scenario: Display login form to anonymous users
    Given an anonymous user
    When I go to the start page
    Then I should see a login form

  Scenario: Redirect to account page when user is logged in
    Given a user "patrick" with the passwort "secret"
    When I go to the account page
    Then I should be logged in

  Scenario: Allow login of a user with valid credentials
    Given a user "patrick" with the passwort "secret"
    When I go to the start page
    And I fill in "login" with "patrick"
    And I fill in "password" with "supersecret"
    And I press "Login"
    Then I should be logged in

  Scenario Outline: Not allow login of a user with bad credentials
    Given a user "patrick" with the passwort "secret"
    When I go to the start page
    And I fill in "login" with "<login>"
    And I fill in "password" with "<password>"
    And I press "Login"
    Then I should not be logged in

  Examples:
      | login   |    password    |
      | patrick |    badsecret   |
      | patrick |                |
      | unknown |     secret     |
      | unknown |    badsecret   |
      | unknown |                |
      |         |                |
      |         |     secret     |
      |         |    badsecret   |