Dir.foreach('./') do |filename|
  if filename.end_with? '.markdown'
    text = File.read filename
    text = text.gsub /On February 1st, 2012.*\n(\s*\n)+/, ""
    puts filename
    puts text
  end
end
