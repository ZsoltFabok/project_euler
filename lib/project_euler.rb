Dir.foreach(File.expand_path('../../lib/project_euler', __FILE__)) do |problem|
  if problem =~ /(problem_[0-9])+\.rb/
    require "project_euler/#{problem}"
  end
end