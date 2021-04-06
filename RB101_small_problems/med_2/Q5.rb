# equilateral: All 3 sides are of equal length
# isosceles: 2 sides are of equal length, while the 3rd is different
# scalene: All 3 sides are of different length

# To be a valid triangle:
    # the sum of the lengths of the two shortest sides must be greater than the length of the longest side
    # and all sides must have lengths greater than 0
    # if either of these conditions is not satisfied, the triangle is invalid.

# Given 3 lengths
    # Check if sum of min 2 is greater than max and all sides > 0
      # if not invalid
    # Set unique_count
    # if unique_count is 3, 2, 1

def triangle(side_1, side_2, side_3)
  sides = [side_1, side_2, side_3]
  return :invalid unless (sides.min > 0) && (sides.min(2).sum > sides.max)

  case sides.uniq.length
  when 3
    :scalene
  when 2
    :isosceles
  when 1
    :equilateral
  end
end


puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid

