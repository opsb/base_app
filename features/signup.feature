Feature: Signup
  In order to use conferencehub
  As a guest
  I want to register
  
  Background:
    Given I am not logged in
    And the following users
      | username | password | email              | first_name | last_name |
      | john_doe | secret   | existing@email.com | jim        | jones     |
  
  Scenario: Valid signup
    When I go to the signup page
	  And I fill in "username" with "opsb"
  	And I fill in "password" with "password"
  	And I fill in "Confirm Password" with "password"
  	And I fill in "email" with "jim.joey@biscuits.com"
  	And I fill in "first name" with "jim"
  	And I fill in "last name" with "jones"
  	And I press "Sign up"
    Then I should be on the /my_account page  	
  	And I should see "Thank you for signing up! You are now logged in."
  	When I follow "My Account"
  	Then I should see "My Account"
  	
  Scenario Outline: Invalid Signup
    When I go to the signup page
    And I fill in "username" with "<username>"
  	And I fill in "password" with "<password>"
  	And I fill in "Confirm Password" with "<confirm_password>"
  	And I fill in "email" with "<email>"
  	And I press "Sign up"
	  Then I should be on the /user page
	  And I should see "<message>"
  	
	Examples:
	  | username | first_name | last_name | email              | password | confirm_password | message                             | show_lost_password_link? |
	  |          | john       | doe       | jim@bob.com        | h3423423 | h3423423         | Username is too short               | false                    |
	  | john_doe | john       | doe       | john.doe@bob.com   | h3423423 | h3423423         | Username has already been taken     | false                    |
	  | jim      |            | jones     | jim@bob.com        | h3423423 | h3423423         | First name can't be blank          | false                    |
	  | jim      | jim        |           | jim@bob.com        | h3423423 | h3423423         | Last name can't be blank           | false                    |
	  | jim      | jim        | jones     |                    | h3423423 | h3423423         | Email is too short                  | false                    |
	  | jim      | jim        | jones     | jim@bob.com        |          | h3423423         | Password is too short               | false                    |
	  | jim      | jim        | jones     | jim@bob.com        | h3423423 |                  | Password doesn't match confirmation | false                    |
	  | jim      | jim        | jones     | existing@email.com | password | password         | Email has already been taken        | true                     |
