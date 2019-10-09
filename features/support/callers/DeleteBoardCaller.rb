require_relative 'ApplicationCaller.rb'

class DeleteBoardCaller < ApplicationCaller

    def initialize
        @prop = PropertiesReader.new
        @base_caller = BaseCaller.new
    end
    
    def get_application
        "TRELLO"
    end

    def delete_board(key, token, board_name_found)
        case 
        when (board_name_found) == ("backlog")
             @id = $board_id
        when (board_name_found) == ("To do")
             @id = $todo_list_id
        when (board_name_found) == ("In Progress")
             @id = $inprogress_list_id
        when (board_name_found) == ("Testing")
             @id = $testing_list_id
        when (board_name_found) == ("Done")
             @id = $done_list_id
        end

        header = key, token
        endpoint = @prop.get_full_url(get_application, "uri.delete_board")
        .sub("id", @id)      
        .sub("yourApiKey", key)
        .sub("yourApiToken", token)
        execute_call_with_headers(endpoint, 'delete', nil, status_expected = 200, header,"Delete a board.")
    end        
end