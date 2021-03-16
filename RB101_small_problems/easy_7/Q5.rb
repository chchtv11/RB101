# Write a method that takes a String as an argument,
# and returns a new String that contains the original value using a staggered capitalization scheme
# in which every other character is capitalized, and the remaining characters are lowercase.
# Characters that are not letters should not be changed,
# but count as characters when switching between upper and lowercase.


# Given a string
# Split string into array
# Loop through array by index:
  # if index + 1 is odd, capitalize.
  # else lowercase

def staggered_case(string)
  new_string = ''
  string.split('').each_with_index do |val, idx|
    if (idx + 1).odd?
      new_string << val.upcase
    else
      new_string << val.downcase
    end
  end
  new_string
end


puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
