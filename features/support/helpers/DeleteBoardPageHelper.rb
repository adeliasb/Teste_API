module DeleteBoardPageHelper

    def delete_board(key, token, board_name_found)
        DeleteBoardCaller.new.delete_board(key, token, board_name_found)
    end

    def expected_deleted_card(response_code)
        expect(response_code).to eql("200")
    end

end