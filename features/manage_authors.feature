Feature: Manage Authors
  In Order to interact with the site
  A user
  Should create and manage their author

  Scenario: Create an author
    Given I am on the home page
    When I follow "Sign Up"
    Then I should be on the signup page
    And I should see "Author Sign Up"
    When I fill in "First Name" with "Bob"
    And I fill in "Last Name" with "Loblaw"
    And I fill in "Phone" with "555-555-5555"
    And I press "Sign me up!"
    Then I should see "Bob Loblaw"
    And I should see "(555) 555-5555"
    And I should see "Stories"
    And I should see "No stories yet"
