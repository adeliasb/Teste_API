module AddCardPageHelper

def add_card(key, token)
    AddCardCaller.new.add_card(key, token)
end

def expected_add_card
    expect($response["name"]).to eql("Test")
end

end