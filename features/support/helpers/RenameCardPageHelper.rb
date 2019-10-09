module RenameCardPageHelper

def rename_card(key, token)
    RenameCardCaller.new.rename_card(key, token)
end

def expected_renamed_card
    expect($response["name"]).to eql("Test DB-Server")
end

end