# frozen_string_literal: true

# printable_name = proc { |first, last| "#{last.upcase}, #{first.upcase}" }
# p printable_name.call('jordan', 'peters')
# p printable_name['jordan', 'peters']

sum_collection = proc do |start, final|
  sum = 0
  (start..final).each do |i|
    sum += i
  end
  sum
end

p sum_collection[10, 30]
