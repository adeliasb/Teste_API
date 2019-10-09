#encoding: utf-8

Given("I have all the required variables to execute the feature: Create board") do
    $key = # it stores the Trello user key
    $token = # it stores the Trello token
    @description = nil # it stores the board description
end
  
Given("I have a valid key") do
    $key = get_valid_key
end
  
Given("I have a valid token generated to authenticate my user") do
    $token = get_valid_token
end
  
When("I add {string} board") do |board_desc|
    @description = board_desc
    add_board($key, $token, @description)
end
  
Then("the board is created successfully") do
    expected_add_board_response
end