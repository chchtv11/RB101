# Write a method that returns the number of Friday the 13ths in the year given by an argument. 
# You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) 
# and that it will remain in use for the foreseeable future.

# Given a year
# set friday_13_count = 0
# Iterate through months in the year
# Check if the 13th day of the month is a friday, increase friday_13_count

require 'date'

def friday_13th(year)
  friday_13_count = 0
  
  1.upto(12) do |month_num|
    friday_13_count += 1 if Date.new(year, month_num, 13).friday? 
  end
  friday_13_count
end


friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2