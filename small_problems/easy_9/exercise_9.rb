def get_grade(score_1, score_2, score_3)
  average_score = (score_1 + score_2 + score_3) / 3
  if average_score < 60
    "F"
  elsif average_score < 70
    "D"
  elsif average_score < 80
    "C"
  elsif average_score < 90
    "B"
  else
    "A"
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"