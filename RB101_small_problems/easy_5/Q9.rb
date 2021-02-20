def crunch(string)
  crunched = []
  last_char = ''
  string.each_char do |char|
    crunched << char if char != last_char
    last_char = char
  end
  crunched.join("")
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
