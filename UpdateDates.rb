puts 'Enter WoW build number:'
wowbuild = gets.to_i

todayStr = Time.now.strftime("%Y-%m-%d")

updatedFiles = []
IO.popen('git diff --name-only HEAD').each do |line|
  updatedFiles << line.chomp if line.chomp.end_with?('.csv')
end
puts "#{updatedFiles.length} updated CSV files..."
puts updatedFiles
puts

puts 'Updating corresponding HTML files...'
Dir.glob("_combinations/*.html").each do |file|
  puts "Checking #{file}"
  text = File.read(file)
  updatedFiles.each do |csv|
    if text.include?(csv)
      new_contents = text.gsub(/\blastupdate: \d{4}-\d{2}-\d{2}\b/, "lastupdate: #{todayStr}")
      new_contents = new_contents.gsub(/\bbuild: \d+\b/, "build: #{wowbuild}")
      File.open(file, "w") {|out| out.puts new_contents }
      puts 'Updated!'
    end
  end
end

Dir.glob("_relics/*.html").each do |file|
  puts "Checking #{file}"
  text = File.read(file)
  updatedFiles.each do |csv|
    if text.include?(csv)
      new_contents = text.gsub(/\bcharttitle: .*\b(\d{4}-\d{2}-\d{2})\b/) { |m| m.gsub!($1, "#{todayStr}") }
      File.open(file, "w") {|out| out.puts new_contents }
      puts 'Updated!'
    end
  end
end

Dir.glob("_trinkets/*.html").each do |file|
  puts "Checking #{file}"
  text = File.read(file)
  updatedFiles.each do |csv|
    if text.include?(csv)
      new_contents = text.gsub(/\bcharttitle: .*\b(\d{4}-\d{2}-\d{2})\b/) { |m| m.gsub!($1, "#{todayStr}") }
      File.open(file, "w") {|out| out.puts new_contents }
      puts 'Updated!'
    end
  end
end

puts
puts 'Done! Press enter to quit...'
gets
