# frozen_string_literal: true

require 'rspec'

# This coding exercise examines how to iterate through the same array a variable number of times and return a
# collection that contains the full set of elements that were looped through.
#
# https://www.youtube.com/watch?v=qVmkfzFF6aI&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=46

def cloned_cycle(collection, number)
  final_items = []

  number.times { final_items.push(*collection) }
  final_items
end

p cloned_cycle((1..3), 3)

describe '#cloned_cycle' do
  it 'iterate through an array' do
    arr = (1..3)
    expect(cloned_cycle(arr, 3)).to match_array([1, 2, 3, 1, 2, 3, 1, 2, 3])
  end
end
