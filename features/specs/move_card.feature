#language: en

Feature: Move a card
  In order to move a card
  As an application
  I can perform a POST request

  Background:
    Given I have all the required variables to execute the feature: Move Card
    And I have a valid key
    And I have a valid token generated to authenticate my user
    And I add "backlog" board
    And I add "Backlog" list into backlog board
    And I add a new card into the list
    And I add "To do" list into backlog board
    And I add "In Progress" list into backlog board
    And I add "Testing" list into backlog board
    And I add "Done" list into backlog board

    Scenario: Move card
       And I move a card to "To do" list
       And I move a card to "In Progress" list
       And I move a card to "Testing" list
       When I move a card to "Done" list
       And the card is moved successfully
       And I delete "backlog" board
