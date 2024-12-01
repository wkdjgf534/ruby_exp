# frozen_string_literal: true

require 'rspec'

# In this coding exercise we'll walk through how to easily rotate the items inside a Ruby array and change
# the index values for each element.
#
# https://www.youtube.com/watch?v=VdwMBBkIfYk&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=26

# rotate - https://ruby-doc.org/3.3.6/Array.html#method-i-rotate
def array_rotation(arr, num) = arr.rotate(num)

p array_rotation([1, 2, 3, 4, 5, 6], 2)

describe '#array_rotation' do
  it 'rotates the index values for each of the array elements' do
    expect(array_rotation([1, 2, 3, 4, 5, 6], 2)).to eq([3, 4, 5, 6, 1, 2])
  end
end
