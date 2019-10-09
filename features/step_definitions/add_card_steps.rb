#encoding: utf-8

Given("I have all the required variables to execute the feature: Add Card") do
    $board_id = nil # it stres the board ID
    $backlog_list_id = nil # it stores the board list ID
end
  
When("I add a new card into the list") do
    add_card($key, $token)
end
  
Then("the card is added successfully") do
    expected_add_card
end