# frozen_string_literal: true

require 'rspec'

# This coding exercise walks through how to implement the Bubble Sort algorithm
# in Ruby and how to add it to the built in Array class.
#
# https://www.youtube.com/watch?v=olE5K0w44H0&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=8

arr = []

# Standard Ruby Array class
class Array
  def bubble_sort
    n = length

    loop do
      swapped = false

      (n - 1).times do |i|
        if self[i] > self[i + 1]
          self[i], self[i + 1] = self[i + 1], self[i]
          swapped = true
        end
      end

      break unless swapped
    end

    self
  end
end

p arr.bubble_sort

describe '.bubble_sort' do
  it 'Properly sorts an array' do
    expect(arr.bubble_sort).to eq(arr.sort)
  end
end
