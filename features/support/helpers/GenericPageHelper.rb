module GenericPageHelper
    
def get_key
    @key = "c7e2ce4f3684a4e2e4d4a1412da6a328"
end

def get_token
    @token = "8edcd6508e1ef93b653fd17b8cf51075fcb448e839c159710e559df359304346"
end

def load_file_name(condition)
    full_filename = Dir.pwd + "/features/samples/add_board/add_board_" + condition + ".json"
    JSON.parse(File.read(full_filename))
end

end