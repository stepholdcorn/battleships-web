Feature: Playing the game
  In order to play battleships
  As a nostalgic player
  I want to see my board

  Scenario: Viewing my own board
    Given I am on the game page
    Then I should see a table
    And it should have the correct rows and columns
