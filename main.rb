Shoes.setup do
	gem 'Text'
end

require 'text'

def load
	File.open('soundex_dictionary.dump') do |line|
		return Marshal.load(line)
	end
end

def similar_to(word)
	return load[Text::Soundex.soundex(word)]
end

Shoes.app :width => 300, :height => 450, :title => "Similar Sounding Words" do

	background '#08a'
	stack :margin => 25 do
		flow do
			@word = edit_line 'Enter a word here', :width => 235
			every 1 do
				text = similar_to(@word.text).join("
")
				@words.clear { 
					para "Similar sounding words:"
					para text, :size => 'xx-small'
				}
			end
		end
		
		@words = stack :margin => 25 do
		end
	end
end