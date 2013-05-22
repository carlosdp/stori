Feature: Manage Sessions
  In Order to authenticate authors
  An author
  Should login to create a story

  Scenario: Login
    Given I am on the home page
    When I follow "Login"
    Then I should be on the login page
  Scenario: Logout
  Scenario: Attempt to cirvumvent access
