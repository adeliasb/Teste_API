#encoding: utf-8

Given("I have all the required variables to execute the feature: Create List") do
    $board_id = nil # it stres the board ID
    @list_description = nil # it stores the list name
    $backlog_list_id = nil # it stores the list ID
    $board_id = nil
end
  
When("I add {string} list into backlog board") do |list|
    @list_description = list
    add_list($key, $token, @list_description)

end
  
Then("the list is added successfully") do
    expected_added_list
end