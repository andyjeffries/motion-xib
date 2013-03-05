require "motion-xib/version"

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  #
end

desc "Create/edit a xib file"
task :xib do
  puts "n) Create a new xib"
  xib_files = {}
  n = 1
  Dir.glob("resources/**/*.xib").each do |xib|
    puts "#{n}) Edit #{xib.gsub(".xib", '').gsub("resources/", '')}"
    xib_files[n] = xib
    n += 1
  end
  print "(n, 1..#{n-1})? "
  choice = STDIN.gets.chomp
  if choice == "n"
    puts "1) iPhone/iPod Touch"
    puts "2) iPad"
    print "(1, 2)? "
    type = STDIN.gets.chomp
    print "Name (without .xib)? "
    name = STDIN.gets.chomp
    if type == "1"
      FileUtils.cp(File.dirname(__FILE__) + "/../templates/iphone.xib", "resources/#{name}.xib")
    elsif type == "2"
      FileUtils.cp(File.dirname(__FILE__) + "/../templates/ipad.xib", "resources/#{name}.xib")
    end
  else
    `open #{xib_files[choice.to_i]} &`
  end
end