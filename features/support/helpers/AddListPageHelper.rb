module AddListPageHelper

def add_list(key, token, list_description)
    AddListCaller.new.add_list(key, token, list_description)
end
  
def expected_added_list
    expect($response["id"]).not_to be_empty
    expect($response["id"]).should_not be_nil
end

end