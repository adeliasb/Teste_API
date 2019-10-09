#language: en

Feature: Add a card
  In order to add a card
  As an application
  I can perform a POST request

  Background:
    Given I have all the required variables to execute the feature: Add Card
    And I have a valid key
    And I have a valid token generated to authenticate my user
    And I add "backlog" board
    And I add "Backlog" list into backlog board

    Scenario: Add card
       When I add a new card into the list
       Then the card is added successfully
       And I delete "backlog" board