Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Registering
    Given I am on the homepage
    When I follow "New Game"
    When I fill in "name" with "Steph"
    When I press "Register" 
    Then I should see "Welcome Steph"