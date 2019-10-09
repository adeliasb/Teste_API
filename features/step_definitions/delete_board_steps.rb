#encoding: utf-8

Given("I have all the required variables to execute the feature: Delete board") do
    $board_id = nil # it stres the board ID
    $backlog_list_id = nil # it stores the list ID
    $card_id = nil # it stores the card ID
    $response = nil # it stores the method response
    $response_code_found = nil # it stores the method response code
end
  
When("I delete {string} board") do |board_name|
    @board_name_found = board_name
    delete_board($key, $token, @board_name_found)
end
  
Then("the board is deleted successfully") do
    expected_deleted_card($response_code_found)
end