require_relative 'soundex'
require_relative 'levenshtein'

def load
  File.open('soundex_dictionary.dump') do |line|
    return Marshal.load(line)
  end
end

print "Loading dictionary... "
similar_to = load
puts "Done!"

if ARGV[0]
  word = ARGV[0]
else
  puts "Enter a word"
  print ">> "
  word = gets.chop
end

puts "Words that sound similar to #{word}:"
a = similar_to[soundex(word)].sort_by { |w| Levenshtein.distance(word, w) }

puts a

