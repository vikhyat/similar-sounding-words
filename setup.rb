require 'soundex'

def save(hash)
  File.open('soundex_dictionary.dump', 'w+') do |line|
    Marshal.dump(hash, line)
  end
end

def parse_dict(dict_path)
  arr = {}
  IO.readlines(dict_path).map do |line|
    begin
      line = line.chomp.split('/')[0]
      arr[soundex(line)] << line rescue arr[soundex(line)] = [line]
    rescue  # Due to some encoding problems
    end
  end
  arr
end

print "Working... "
save(parse_dict('en_US.dic'))	# Replace en_US.dic with something else
puts "Done!"

