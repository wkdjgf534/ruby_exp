# frozen_string_literal: true

require 'rspec'

# In this Ruby programming exercise we're going to have some fun because we're going to figure out how we can find
# the first repeated element in a ruby array and we're going to learn quite a bit about the hash data structure
# as we do it.
#
# https://www.youtube.com/watch?v=ix-cOz8YRGs&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=95

def first_repeated_element(arr)
  return nil if arr.empty?

  counter_hash = Hash.new(0)

  arr.each do |elem|
    counter_hash[elem] = counter_hash[elem] += 1
    return elem if counter_hash[elem] > 1
  end

  nil
end

p first_repeated_element([5, 3, 4, 5, 3, 1])

describe '#first_repeated_element' do
  it 'returns the first repeated element from an array' do
    arr_one = [5, 3, 4, 5, 3, 1]
    expect(first_repeated_element(arr_one)).to eq(5)

    arr_two = [5, 7, 3, 8, 3, 4, 5, 3, 1]
    expect(first_repeated_element(arr_two)).to eq(3)
  end

  it 'returns nil for an empty array' do
    arr = []
    expect(first_repeated_element(arr)).to be_nil
  end

  it 'returns nil if no duplicates are found' do
    arr = [1, 2, 3]
    expect(first_repeated_element(arr)).to be_nil
  end
end
