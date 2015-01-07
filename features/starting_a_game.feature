Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Blank Name Error
    Given I am on the register page
    When I fill in "name" with ""
    When I press "Register"
    Then I should see "Please input a name" 

  Scenario: First player
    Given I am on the register page
    When I fill in "name" with "Steph"
    When I press "Register"
    Then I should see "Player 1 has been assigned to Steph"

  Scenario: Ship placement
    Given I am on the ship placement page
    When I fill in "bs_coord" with "A1"
    When I select "Vertical" from "bs_orientation"
    When I fill in "ac_coord" with "C4"
    When I select "Horizontal" from "ac_orientation"
    When I press "Place"
    Then I should see "Battleship placed"
    And I should see "Aircraft Carrier placed"


  