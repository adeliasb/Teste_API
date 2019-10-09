class BaseCaller
  def initialize
     @debug_external_call = nil
  end

  def call_service(endpoint, method, body, expected_status, info, headers = {})
    parameters = {
    headers: headers,
    debug_output: @debug_external_call,
    body: body
    }
    log_request_screen(endpoint, parameters, info)

    response = nil
    case method
    when 'post'
      response = HTTParty.post(endpoint, parameters)
    when 'get'
      response = HTTParty.get(endpoint, parameters)
    when 'put'
      response = HTTParty.put(endpoint, parameters)
    when 'delete'
      response = HTTParty.delete(endpoint, parameters)
    else
      raise 'ERROR: Invalid method to external call: ' + method
    end
    log_response_screen(response, info)
  end

  # Request output
  def log_request_screen(endpoint, parameters, service)
    puts '------------------------------------------------------------------------------------------------------------------------'
    puts 'REQUEST TO ' + service
    puts 'endpoint: ' + endpoint.to_s
    puts 'parameters: ' + JSON.pretty_generate(parameters)
    puts '------------------------------------------------------------------------------------------------------------------------'
  end

  # Request response output
  def log_response_screen(response, service)
    $response = (response).parsed_response
    $response_code_found = response.code.to_s

    case 
    when ($response["name"]) == ("Test")
         $card_id = $response["id"]
    when ($response["name"]) == ("Backlog")
         $backlog_list_id = $response["id"]
    when ($response["name"]) == ("To do")
         $todo_list_id = $response["id"]
    when ($response["name"]) == ("In Progress")
          $inprogress_list_id = $response["id"]
    when ($response["name"]) == ("Testing")
         $testing_list_id = $response["id"]
    when ($response["name"]) == ("Done")
         $done_list_id = $response["id"]
    when ($response["name"]) == ("backlog")
          $board_id = $response["id"]
    end

    trello_trace_id = JSON.parse(response.headers.to_json)['trello_trace_id']
    trello_trace_id = trello_trace_id[0] unless trello_trace_id.nil?
    trello_trace_id = 'NULL' if trello_trace_id.nil?
    puts '------------------------------------------------------------------------------------------------------------------------'
    puts 'RESPONSE FROM ' + service
    puts JSON.pretty_generate(response.parsed_response)
    puts 'trello_trace_id: ' + trello_trace_id
    puts 'response code: ' + response.code.to_s
    puts '------------------------------------------------------------------------------------------------------------------------'
  end
end
