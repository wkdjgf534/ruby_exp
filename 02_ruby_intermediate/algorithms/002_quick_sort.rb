# frozen_string_literal: true

class Array
  def quicksort
    return [] if empty?

    pivot = delete_at(rand(size)) # select random number
    left, right = partition(&pivot.method(:>)) # split array by 2 pieces

    [left.quicksort, pivot, *right.quicksort].flatten
  end
end

array = (1..5).to_a.shuffle

puts 'Starting array'
p array

puts 'Ending array'
p array.quicksort
