module_name = "project_euler"

require "#{module_name}/common"

Dir.foreach(File.expand_path("../../lib/#{module_name}/problems", __FILE__)) do |problem|
  if problem =~ /(problem_[0-9])+\.rb/
    require "#{module_name}/problems/#{problem}"
  end
end
