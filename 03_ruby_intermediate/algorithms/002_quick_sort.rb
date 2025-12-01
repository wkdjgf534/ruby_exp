# frozen_string_literal: true

class Array
  def quicksort
    return [] if empty?

    pivot = delete_at(rand(size))

    left, right = partition(&pivot.method(:>))

    [left.quicksort, pivot, *right.quicksort].flatten
  end
end

array = (1..500).to_a.shuffle

puts 'Starting array'
p array

puts 'Ending array'
p array.quicksort
