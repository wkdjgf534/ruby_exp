# frozen_string_literal: true

grade = 95

if (grade >= 70) && (grade < 80)
  puts 'C'
elsif (grade >= 80) && (grade < 90)
  puts 'B'
elsif grade >= 90
  puts 'A'
else
  puts 'Failing'
end
