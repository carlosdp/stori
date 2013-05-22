Feature: Manage Sessions
  In Order to authenticate authors
  An author
  Should login to create a story

  Scenario: Successful Login
    Given There are authors
    Given I am on the home page
    When I follow "Login"
    Then I should be on the login page
    When I fill in "Email" with "tony@stark.com"
    And I fill in "Password" with "testpass"
    And I press "Login"
    Then I should be on the home page
    And I should see "Successful"
    And I should see "Logout"
  Scenario: Logout
    Given There are authors
    Given I am logged in as an author
    Given I am on the home page
    When I follow "Logout"
    Then I should be on the home page
    And I should see "Successfully logged out"
    And I should not see "Logout"
