# Write a method that returns the number of Friday the 13ths in the year given by an argument. 
# You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) 
# and that it will remain in use for the foreseeable future.

# 1753 was a common year starting on a Monday
# Feb: 28 days in a common year, 29 days in a leap year
# leap year occurs once every 4 years
# 1756 was the first leap year

# given year
# set start_year = 1753
# set month_starts_on = 0
# set leap_year_counter = 1
# set friday_13_counter = 0
# set days_in_feb = 29 if leap_year_counter is 4, 28 otherwise
# set days_of_week = ['Monday', 'Tuesday',...]
# set days_in_month = [31, days_in_feb, rep([31, 30], 5)]
# iterate from start_year to year:
    # set year_starts_on = year_starts_on()

  # When current_year == year
  # for each month in year:
      # iterate over months:
        # friday_13_counter += 1 if month_starts_on = 1
        # month_starts_on = (days_in_month % 28)

# days_in_feb = leap_year_counter == 4 ? 29 : 28
# days_in_month = [31, days_in_feb] + ([31, 30] * 5)

def year_starts_on(year)
  initial_year = 1753
  day_of_week = 1
  day_of_week_increase = 1
  leap_year_counter = 2
  
  (year - initial_year).times do |x|
    
    # puts "current_year: #{initial_year + x + 1}"
    # puts "day_of_week_increase: #{day_of_week_increase}"
    
    if day_of_week + day_of_week_increase > 7
      day_of_week = (day_of_week + day_of_week_increase) % 7
    else
      day_of_week += day_of_week_increase
    end
    
    # puts "day_of_week: #{day_of_week}"
    
    # puts "leap_year_counter: #{leap_year_counter}"
    if leap_year_counter == 4
      day_of_week_increase = 2
      leap_year_counter = 1
    else
      day_of_week_increase = 1
      leap_year_counter += 1
    end
  end
  
  day_of_week
end

puts "year starts on: #{year_starts_on(2014)}"

# friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2

puts year_starts_on(1754) == 2
puts year_starts_on(1755) == 3
puts year_starts_on(1756) == 4
puts year_starts_on(1757) == 6
puts year_starts_on(1758) == 7
puts year_starts_on(1759) == 1
puts year_starts_on(1760) == 2
puts year_starts_on(1761) == 4
puts year_starts_on(1762) == 5

puts year_starts_on(1763) == 6
puts year_starts_on(1764) == 7
puts year_starts_on(1765) == 2
puts year_starts_on(1766) == 3
puts year_starts_on(1767) == 4

