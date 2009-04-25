require 'soundex'
require 'pp'

def log(arr)
  File.open('soundex_dictionary.dump', 'w+') do |line|
    Marshal.dump(arr, line)
  end
end

def parse_dict(dict_path)
  arr = {}
  IO.readlines(dict_path).map do |line|
    line.chomp!.force_encoding("ISO-8859-1")
    line = line.split('/')[0]
    arr[soundex(line)] << line rescue arr[soundex(line)] = [line]
  end
  arr
end

print "Working... "
log(parse_dict('en_US.dic'))	# Replace en_US.dic with something else
puts "Done!"
