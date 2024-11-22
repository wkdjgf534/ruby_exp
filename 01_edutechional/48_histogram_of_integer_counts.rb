# frozen_string_literal: true

require 'rspec'

# This guide examines how to build a histogram in Ruby that takes in an Array of integers and returns a Hash that
# counts the number of occurrences of each integer.
#
# https://www.youtube.com/watch?v=uYOh601_quQ&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=52

arr = [1, 4, 1, 3, 2, 1, 4, 5, 4, 4, 5, 4]

def num_counter(arr) = arr.tally

p num_counter(arr)

describe '#num_counter' do
  it 'returns a hash that contains the number' do
    expect(num_counter(arr)).to eq({ 1 => 3, 4 => 5, 3 => 1, 2 => 1, 5 => 2 })
  end
end
