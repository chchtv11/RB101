require 'date'

puts Date.civil
# DATE -4712-01-01

puts Date.civil(2016)
# DATE 2006-01-01

puts Date.civil(2016, 5)
# DATE 2016-05-01

puts Date.civil(2016, 5, 13)
# DATE 2016-05-13
