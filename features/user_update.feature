Feature: Update account
  In order to maintain correct account details
  As a user
  I want to update my account details

  Background:
    Given the following users
      | username | password | email              | first_name | last_name |
      | john_doe | secret   | existing@email.com | john       | doe       |
    And I am logged in as "john_doe" with the password "secret"

  Scenario: Update account details
    When I follow "My Account"
    Then I should see "My Account"
    And the "first name" field should contain "john"
    And the "last name" field should contain "doe"    
    And the "username" field should contain "john_doe"
    And the "email" field should contain "existing@email.com"
    And I fill in "username" with "jessica"
    And I press "Save"
    Then I should see "My Account"
    And the "username" field should contain "jessica"
    