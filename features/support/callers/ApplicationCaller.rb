class ApplicationCaller

  def initialize
    @prop = PropertiesReader.new
    @base_caller = BaseCaller.new
  end

  def execute_call(endpoint, method, body, expected_status, info = "")
    @base_caller.call_service(endpoint, method, body, expected_status, info)
  end

  def execute_call_nil_body(endpoint, method, expected_status, info = "")
    @base_caller.call_service(endpoint, method, nil, expected_status, info)
  end

  def execute_call_with_headers(endpoint, method, body, expected_status, header, info = "")
    @base_caller.call_service(endpoint, method, body, expected_status, info, header)
  end
end