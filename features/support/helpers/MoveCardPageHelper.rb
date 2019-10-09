module MoveCardPageHelper

   def move_card(key, token, list_description)
       MoveCardCaller.new.move_card(key, token, list_description)
   end

   def expected_moved_card(response_code)
       expect(response_code).to eql("200")
   end
end