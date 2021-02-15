# given two strings
# set shortest_string = string with smallest length
# return concatenation of shortest_string, other string, shortest_string

def short_long_short(string_1, string_2)
  if string_2.length > string_1.length
    return string_1 + string_2 + string_1
  else
    return string_2 + string_1 + string_2
  end
end

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
