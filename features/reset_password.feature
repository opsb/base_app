Feature: Reset password
  In order to regain access to my account
  As a user
  I want to reset my password

  Background:
    Given the following users
      | email    | 
      | john_doe@bob.com |

  Scenario: Reset password
    When I am on the login page
    And I follow "forgotten password?"
    And I fill in "email" with "john_doe@bob.com"
    And I press "Reset my password"
    Then I should see "Instructions to reset your password have been emailed to you. Please check your email."
    And "john_doe@bob.com" should receive 1 email
    When "john_doe@bob.com" opens the email with subject "Password Reset Instructions"
    Then I should see "/password_resets/" in the email body
    When I click the first link in the email
    Then I should see "Change My Password"
    When I fill in "password" with "techno_steak"
    And I fill in "password confirmation" with "techno_steak"
    And I press "Update my password and log me in"
    Then I should be on the / page
    