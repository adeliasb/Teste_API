require_relative 'ApplicationCaller.rb'

class AddCardCaller < ApplicationCaller

    def initialize
        @prop = PropertiesReader.new
        @base_caller = BaseCaller.new
    end
    
    def get_application
        "TRELLO"
    end

    def add_card(key, token)
        header = key, token
        endpoint = @prop.get_full_url(get_application, "uri.add_card")
        .sub("name=name", "name=Test")
        .sub("idList=idList", "idList=" + $backlog_list_id)  
        .sub("yourApiKey", key)
        .sub("yourApiToken", token)
        execute_call_with_headers(endpoint, 'post', nil, status_expected = 200, header,"Create a new card")
    end
end