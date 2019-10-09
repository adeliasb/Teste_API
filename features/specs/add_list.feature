#language: en

Feature: Create list
  In order to create a new list
  As an application
  I can perform a POST request

  Background:
    Given I have all the required variables to execute the feature: Create List
    And I have a valid key
    And I have a valid token generated to authenticate my user
    And I add "backlog" board

    Scenario: Create lists on backlog board    
       And I add "Backlog" list into backlog board
       And I add "ToDo" list into backlog board
       And I add "In Progress" list into backlog board
       And I add "Testing" list into backlog board
       When I add "Done" list into backlog board
       Then the list is added successfully
       And I delete "backlog" board

