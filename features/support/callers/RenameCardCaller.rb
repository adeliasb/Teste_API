require_relative 'ApplicationCaller.rb'

class RenameCardCaller < ApplicationCaller

    def initialize
        @prop = PropertiesReader.new
        @base_caller = BaseCaller.new
    end
    
    def get_application
        "TRELLO"
    end

    def rename_card(key, token)
        header = key, token
        endpoint = @prop.get_full_url(get_application, "uri.rename_card")
        .sub("id", $card_id)
        .sub("name=name", "name=Test DB-Server")
        .sub("yourApiKey", key)
        .sub("yourApiToken", token)
        execute_call_with_headers(endpoint, 'put', nil, status_expected = 200, header,"Update a card")
    end
end