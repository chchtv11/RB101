def fibonacci(n)
  return 1 if [1, 2].include?(n)

  numbers = [1, 1]
  2.upto(n - 1) do |index|
    numbers << (numbers[index - 1] + numbers[index - 2])
  end

  numbers[n - 1]
end


fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501
