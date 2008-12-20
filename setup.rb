require 'text'

def log(arr)
	File.open('soundex_dictionary.dump', 'w+') do |line|
		Marshal.dump(arr, line)
	end
end

def parse_dict(dict_path)
	arr = {}
	words = IO.readlines(dict_path).map do |line|
		line.chomp!
		line = line.split('/')[0]
		if(arr.include? Text::Soundex.soundex(line))
			arr[Text::Soundex.soundex(line)] += [line]
		else
			arr[Text::Soundex.soundex(line)] = [line]
		end
		puts "Added #{line}"
	end
	arr
end

log(parse_dict('en_US.dic'))	# Replace en_US.dic with something else if that's not the dictionary you are going to use