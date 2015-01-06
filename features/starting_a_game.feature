Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Registering
    Given I am on the register page
    When I fill in "name" with "Steph"
    When I press "Register" 
    Then I should see "Welcome Steph"

  Scenario: Blank Name Error
    Given I am on the register page
    When I fill in "name" with ""
    When I press "Register"
    Then I should see "Please input a name" 