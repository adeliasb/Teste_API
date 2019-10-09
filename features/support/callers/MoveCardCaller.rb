require_relative 'ApplicationCaller.rb'

class MoveCardCaller < ApplicationCaller

    def initialize
        @prop = PropertiesReader.new
        @base_caller = BaseCaller.new
    end
    
    def get_application
        "TRELLO"
    end

    def move_card(key, token,list_description)
        case 
        when (list_description) == ("Backlog")
             @id = $backlog_list_id
        when (list_description) == ("To do")
             @id = $todo_list_id
        when (list_description) == ("In Progress")
             @id = $inprogress_list_id
        when (list_description) == ("Testing")
             @id = $testing_list_id
        when (list_description) == ("Done")
             @id = $done_list_id
        end

        header = key, token
        endpoint = @prop.get_full_url(get_application, "uri.move_card")
        .sub("id", $card_id)      
        .sub("idList", "idList=" + @id)
        .sub("yourApiKey", key)
        .sub("yourApiToken", token)
        execute_call_with_headers(endpoint, 'put', nil, status_expected = 200, header,"Update a card")
    end  
end