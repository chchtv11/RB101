def word_sizes(string)
  lengths = Hash.new(0)
  string.gsub(/[^a-z ]/i, '').split.each do |word|
    lengths[word.length] += 1
  end
  lengths
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}
