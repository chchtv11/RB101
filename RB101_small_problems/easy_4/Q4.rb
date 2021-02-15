# Prior to 1752, the Julian Calendar was used.
# Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

def leap_year?(year)
  if year < 1752
    return year % 4 == 0
  else
    return ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)
  end
end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true
