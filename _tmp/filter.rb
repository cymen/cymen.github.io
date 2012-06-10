Dir.foreach('./') do |filename|
  if filename.end_with? '.markdown'
    text = File.read filename
    filtered = text.gsub /On February 1st, 2012.*\n(\s*\n)+/, ""
    if filtered != text
      puts "Writing changes to: #{filename}"
      File.open(filename, "w") {|file| file.puts filtered}
    else
      puts "No changes for: #{filename}"
    end
  end
end
