require 'find'

module_name = "project_euler"
Find.find(File.expand_path("../../lib/#{module_name}", __FILE__)) do |file|
  if file.end_with?(".rb")
    require file
  end
end