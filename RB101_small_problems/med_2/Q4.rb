# Write a method that takes a string as argument, 
# and returns true if all parentheses in the string are properly balanced, false otherwise.
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.


# Requirements:
# every open parenthesis has to have a closing parenthesis. 
# any closing parenthesis that is not preceeded by an opening parenthesis is illegal

# Given a string
# Set pairs = []
# set chars = array of characters in string
# Iterate through chars:
    # If the character is an opening parenthesis:
        # find the leftmost closing parenthesis after the current char where the index isnt already in `pairs`
            # if no character exists, return flalse
    # If the character is a closing parenthesis, check that the index is in `pairs`
        # if not, return false
    # Add indices of chars to `pairs` as nested array
        

def balanced?(string)
    chars = string.split('')
    pairs = []
    
    chars.each_with_index do |char, idx|
        current_pair = []
        if char == '('
            current_pair << idx
            chars.each_with_index do |sub_char, sub_idx|
                if (sub_idx <= idx) || (pairs.flatten.include?(sub_idx))
                    next
                elsif sub_char == ')'
                    current_pair << sub_idx 
                    break
                end
            end
            pairs << current_pair
            
        elsif char == ')'
            return false unless pairs.flatten.include?(idx)
        end
    end
    
    pairs.flatten.count.even?
end
                
            


puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false