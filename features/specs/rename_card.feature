#language: en

Feature: Rename card
  In order to rename a card
  As an application
  I can perform a PUT request

  Background:
    Given I have all the required variables to execute the feature: Rename a card
    And I have a valid key
    And I have a valid token generated to authenticate my user
    And I add "backlog" board
    And I add "Backlog" list into backlog board
    And I add a new card into the list

    Scenario: Rename a card
       When I try to rename the card
       Then the card name is updated successfully
       And I delete "backlog" board