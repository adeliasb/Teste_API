require_relative 'ApplicationCaller.rb'

class AddListCaller < ApplicationCaller

    def initialize
        @prop = PropertiesReader.new
        @base_caller = BaseCaller.new
    end
    
    def get_application
        "TRELLO"
    end

    def add_list(key, token, list_description)
        header = key, token
        endpoint = @prop.get_full_url(get_application, "uri.add_list")
        .sub("idBoard=idBoard", "idBoard=" + $board_id)
        .sub("name=name", "name=" + list_description)
        .sub("yourApiKey", key)
        .sub("yourApiToken", token)
        execute_call_with_headers(endpoint, 'post', nil, status_expected = 200, header,"Create a new list on a board")
    end
end