require 'pry'

arr = ["9", "8", "7", "10", "11"]

iterator = 0
while iterator < arr.length
    x = arr[iterator].to_i
    y = arr[iterator + 1].to_i
    puts "x: #{x}, y: #{y}"
    puts "comparison: #{x <=> y}"
    iterator += 1
end

p arr.sort do |x, y|
    x.to_i <=> y.to_i
  end

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 