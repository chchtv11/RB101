 # leap years occur in every year that is evenly divisible by 4
 # unless the year is also divisible by 100.

 # If the year is evenly divisible by 100, then it is not a leap year
 # unless the year is evenly divisible by 400.

def leap_year?(year)
  ((year % 4 == 0) && (year % 100 != 0)) || year % 400 == 0)
end

# BONUS - make the logic for divisible by 4 first
# def leap_year?(year)
#   result = false
#   if (year % 4 == 0)
#     result = true
#     puts '4'
#   end
#   if (year % 100 == 0)
#     result = false
#     puts '100'
#   end
#   if (year % 400 == 0)
#     result = true
#     puts '400'
#   end
#   result
# end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true
