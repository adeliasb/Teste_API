#encoding: utf-8

Given("I have all the required variables to execute the feature: Move Card") do
    $board_id = nil # it stres the board ID
    $backlog_list_id = nil # it stores the list ID
    $card_id = nil # it stores the card ID
    $done_list_id = nil # it stores the list named Done
    $inprogress_list_id = nil # it stores the list named In Progress
    @list_description = nil # it stores the list description 
    $testing_list_id = nil # it stores the list named Testing
    $todo_list_id = nil # it stores the list named ToDo
    $response = nil # it stores the method response
    $response_code_found = nil # it stores the method response code
end
  
Given("I move a card to {string} list") do |list|
    $list_description = list
    move_card($key, $token, @list_description)  
end
  
Then("the card is moved successfully") do
    expected_moved_card($response_code_found)
end