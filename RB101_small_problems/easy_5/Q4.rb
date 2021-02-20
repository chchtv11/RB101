def swap(sentence)
  word_array = sentence.split.map { |word| word.split("") }
  swapped = []

  word_array.each do |word|
    if word.size > 1
      first_char = word.delete_at(0)
      last_char = word.pop
      word.prepend(last_char).push(first_char)
    end
    swapped << word.join("")
  end

  swapped.join(" ")
end

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
