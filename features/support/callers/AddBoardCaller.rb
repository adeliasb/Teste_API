require_relative 'ApplicationCaller.rb'

class AddBoardCaller < ApplicationCaller

    def initialize
        @prop = PropertiesReader.new
        @base_caller = BaseCaller.new
    end
    
    def get_application
        "TRELLO"
    end

    def add_board(key, token, description)
        header = key, token
        endpoint = @prop.get_full_url(get_application, "uri.add_board")
        .sub("name=name", "name=" + description)
        .sub("yourApiKey", key)
        .sub("yourApiToken", token)
        execute_call_with_headers(endpoint, 'post', nil, status_expected = 200, header,"Create a new board.")
    end
end
