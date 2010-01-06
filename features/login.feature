Feature: Login
  In order to use conferencehub
  As a user
  I want to login

  Background:
    Given the following users
      | username | password | email              |
      | john_doe | secret   | existing@email.com |

  Scenario: Valid login
    When I go to the login page
    And I fill in "username" with "john_doe"
    And I fill in "password" with "secret"
    And I press "Log in"
    Then I should be on the /my_account page
    And I should see "Logged in successfully."

  Scenario: Invalid username
  	When I go to the login page
    And I fill in "username" with "invalid username"
    And I fill in "password" with "secret"
    And I press "Log in"
    Then I should be on the /user_sessions page
    And I should see "Username is not valid"

  Scenario: Invalid password
  	When I go to the login page
    And I fill in "username" with "john_doe"
    And I fill in "password" with "invalid"
    And I press "Log in"
    Then I should be on the /user_sessions page
    And I should see "Password is not valid"

  Scenario: My account page redirects to login page when no user session exists
    Given I am not logged in
    When I go to the my_account page
    Then I should be on the /login page