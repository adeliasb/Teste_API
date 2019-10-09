class TemplatesReader

# Read json format files and retrieves the json parsed
  def read_template_as_json(full_filename)
    JSON.parse(File.read(Dir.pwd + '/features/samples/' + full_filename))
  end

  def read_template_as_text(full_filename)
    File.read(Dir.pwd + '/features/samples/' + full_filename)
  end

end