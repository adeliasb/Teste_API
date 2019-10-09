module AddBoardPageHelper

def get_valid_key
    get_key
end

def get_valid_token
    get_token
end

def add_board(key, token, description)
    @board_description = description
    AddBoardCaller.new.add_board(key, token, @board_description)
end

def expected_add_board_response
    expect($response["name"]).to eql(@board_description)
end

end