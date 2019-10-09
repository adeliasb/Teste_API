class PropertiesReader

  def initialize
    path_properties_file = Dir.pwd + '/features/support/applications.properties.json'
    @json_properties_file = JSON.parse(File.read(path_properties_file))
  end

  def get_full_url(application, uri)
    applications = get_application(application)
    full_url = applications['base_url']
    unless uri.to_s.empty?
      full_url += applications[uri]
    end
    full_url
  end

  def get_application_headers(application, header_info_for_build, type)
    applications = get_application(application)
    application_headers = applications['headers']
    if application_headers.nil?
      raise "The application " + application + " has no headers"
    end

    headers_keys = application_headers["key"]
    header_values = application_headers["value"]

    header_return = {
        "content-type": get_content_type(type)
    }

    header_info_for_build.each do |header_info|
      value_found = header_values[header_info[:find_value].upcase]
      if (headers_keys.include? header_info[:key]) && (value_found != nil && value_found != '')
        header_return[header_info[:key].downcase] = value_found
      end
    end

    header_return

  end

  def get_application(application)
    @json_properties_file['applications'][application]
  end

  def get_context(context)
    @json_properties_file['contexts'][context]
  end

  def get_user(user)
    @json_properties_file['users'][user]
  end

  def get_content_type(type)
    @json_properties_file['contentType'][type]
  end

  def get_headers_content_type(type)
    { "content-type": get_content_type(type) }
  end

end
  
  