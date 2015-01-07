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
    When I select "horizontally" from "bs_orientation"
    When I fill in "ac_coord" with "B1"
    When I select "horizontally" from "ac_orientation"
    When I fill in "d_coord" with "C1"
    When I select "horizontally" from "d_orientation"
    When I fill in "s_coord" with "D1"
    When I select "horizontally" from "s_orientation"
    When I fill in "pb_coord" with "E1"
    When I select "horizontally" from "pb_orientation"
    When I press "Place"
    Then I should see "Battleship placed"
    And I should see "Aircraft Carrier placed"


  