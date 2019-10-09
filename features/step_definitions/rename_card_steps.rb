#encoding: utf-8

Given("I have all the required variables to execute the feature: Rename a card") do
    $board_id = nil # it stres the board ID
    $backlog_list_id = nil # it stres the list ID
    $card_id = nil # it stores the card ID
end
  
When("I try to rename the card") do
    rename_card($key, $token)
end
  
Then("the card name is updated successfully") do
    expected_renamed_card
end