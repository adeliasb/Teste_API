#language: en

Feature: Delete board
  In order to delete a board
  As an application
  I can perform a POST request

  Background:
    Given I have all the required variables to execute the feature: Delete board
    And I have a valid key
    And I have a valid token generated to authenticate my user
    And I add "backlog" board
    And I add "To do" board
    And I add "In Progress" board
    And I add "Testing" board
    And I add "Done" board

    Scenario: Delete board
       And I delete "backlog" board
       And I delete "To do" board
       And I delete "In Progress" board
       And I delete "Testing" board
       When I delete "Done" board
       Then the board is deleted successfully