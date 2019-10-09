#language: en

Feature: Create board
  In order to create a new board
  As an application
  I can perform a POST request

  Background:
    Given I have all the required variables to execute the feature: Create board
    And I have a valid key
    And I have a valid token generated to authenticate my user

    Scenario: Create Backlog Trello board
       When I add "backlog" board
       Then the board is created successfully
       And I delete "backlog" board

    Scenario: Create To do Trello board
       When I add "To do" board
       Then the board is created successfully

    Scenario: Create In progress Trello board
       When I add "In Progress" board
       Then the board is created successfully

    Scenario: Create Testing Trello board
       When I add "Testing" board
       Then the board is created successfully

    Scenario: Create Done Trello board
       When I add "Done" board
       Then the board is created successfully