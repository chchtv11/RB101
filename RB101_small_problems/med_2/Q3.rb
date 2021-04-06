def letter_percentages(string)
  percentages = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  
  string.each_char do |char|
    if char.match?(/[A-Z]/)
      percentages[:uppercase] += 1
    elsif char.match?(/[a-z]/)
      percentages[:lowercase] += 1
    else
      percentages[:neither] += 1
    end
  end
  
  percentages.each { |key, val| percentages[key] = (val / string.length.to_f) * 100 }
end
      


    

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }