# Define a method to find a word ladder count between two words
def ladder_length(begin_word, end_word, word_list)
	# Create a set to store words in the list
	s = Set.new(word_list)

	# Return if end word is not in the list
	return [] if !s.include?(end_word)
	# Create a queue to store possible ladders
	queue = [begin_word]

	#initializing the count with zero
	count = 0

	# Loop through the queue
	until queue.empty?
		count += 1
		# Loop through the characters in the current word
		queue.size.times do
		word = queue.shift
		begin_word.size.times do |i|
				word_dup = word.dup
				# Replace each character with a to z
				('a'..'z').each do |ch|
				# Create a new word
				word_dup[i] = ch
				# If the new word is in the word list
				if s.include?(word_dup)
						return count + 1 if word_dup == end_word
						# Add the new word and ladder to the queue
						queue.push(word_dup.dup)
						s.delete(word_dup)
				end
				end
		end
		end
	end
  0
end
 
ladder = ladder_length("hit", "cog", ["hot","dot","dog","lot","log"])


puts ladder