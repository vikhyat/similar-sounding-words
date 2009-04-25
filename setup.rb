# coding: ascii

# Modified version of http://snippets.dzone.com/posts/show/4530
def soundex(string)
  chars     = 'BPFVCSKGJQXZDTLMNR'
  nums      = '111122222222334556'
  chars_ex  = '^BPFVCSKGJQXZDTLMNR'
  chars_del = '^A-Z'

  str = string.upcase.delete(chars).squeeze

  str[0..0] + str[1..-1]
  .delete(chars_ex)
  .tr(chars, nums)[0..2]
  .ljust(3, '0') rescue ''
end

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
log(parse_dict('en_US.dic'))	# Replace en_US.dic with something else if that's not the dictionary you are going to use
puts "Done!"
