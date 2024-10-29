# frozen_string_literal: true

require 'rspec'

# In this exercise you'll learn how to select the odd elements from an array of integers and return
# the collection of odd items.
#
# https://www.youtube.com/watch?v=_xuamr1ijmc&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=21

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

# Standard Ruby Array class
class Array
  def odd_selector = select(&:odd?)
end

p arr.odd_selector

describe '.odd_selector' do
  it 'returns a collection of the odd elements' do
    expect(arr.odd_selector).to eq([1, 3, 5, 7, 9])
  end
end
