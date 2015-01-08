Feature: Playing the game
  In order to play battleships
  As a nostalgic player
  I want to see my board

  Scenario: Viewing my own board
  	Given I have a player
    Given I have placed my ships
    Then I should see ship 20 times 


