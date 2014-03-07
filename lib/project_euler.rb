module_name = "project_euler"
Dir.foreach(File.expand_path("../../lib/#{module_name}", __FILE__)) do |problem|
  if problem =~ /(problem_[0-9])+\.rb/
    require "#{module_name}/#{problem}"
  end
end