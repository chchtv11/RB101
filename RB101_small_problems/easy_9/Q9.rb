
def get_grade(score_1, score_2, score_3)
  avg = (score_1 + score_2 + score_3) / 3
  if (90..100).include?(avg)
    'A'
  elsif (80..89).include?(avg)
    'B'
  elsif (70..79).include?(avg)
    'C'
  elsif (60..69).include?(avg)
    'D'
  else
    'F'
  end
end


get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"
