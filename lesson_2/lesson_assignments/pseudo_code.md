1. a method that returns the sum of two integers

*Pseudo Code*

Get first number from user. Store as number_1
Get second number from user. Store as number_2
Add number_1 to number_2
Return result

*Formal*

START
GET number. SET number_1
GET number. Set number_2
PRINT number_1 + number_2
END




2. a method that takes an array of strings, and returns a string that is all those strings concatenated together

*Pseudo Code*

Given an array of strings.
Set output as blank string

Iterate through array of items:
  - Concatenate item to output

Return output


*FORMAL*

START

-- Given an array called "strings"

SET iterator = 0
SET output = ""

WHILE iterator <= length of strings
  SET output = concatenation of output and value within strings at space "iterator"

  SET iterator = iterator + 1

PRINT output
END


3. a method that takes an array of integers, and returns a new array with every other element

*Pseudo Code*

Given an array of integers original_array

Set new_array as a blank array

Iterate over original_array:
  - if space in original_array is odd, add it to new_array

Return new_array

*Formal*

-- Given an array of integers original_array
SET new_array = []
SET iterator = 0
SET new_array_iterator = 0

WHILE iterator < length of original_array:
  - if iterator is odd or iterator == 0:
      - Add item that occupies space at "iterator" in original_array to new_array (at space of "new_array_iterator")
      - new_array_iterator = new_array_iterator + 1
  - iterator = iterator + 1

RETURN new_array
END
