# frozen_string_literal: true

arr = [1, 4, 3, 1, 3, 4, 14]

# result =  arr.inject do |sum, i|
#  sum + i
# end
#
# p result

p arr.inject(&:*)
