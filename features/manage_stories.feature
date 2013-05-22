Feature: Manage Stories
  In Order to create adventures
  An author
  Should create stories and manage stories

  Scenario: View all stories
    Given I have valid stories
    Given I am on the home page
    When I follow "Stories"
    Then I should see "The Cool Thing"
    And I should see "The Other Cool Thing"
    When I follow "The Cool Thing"
    Then I should see "The Cool Thing"
    And I should see "Authors"
    And I should see "Luke"

  Scenario: Create new story
    Given I am on the home page
    When I follow "Create a Story"
    Then I should be on the new_story page
    When I fill in "Title" with "This Story"
    And I press "Begin Story"
    Then I should see "This Story"
    And I should see "Luke"
    And I should see "Authors"

  Scenario: Edit a story

  Scenario: Deactivate a story
