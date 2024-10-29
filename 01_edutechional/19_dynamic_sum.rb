# frozen_string_literal: true

require 'rspec'

# This coding exercise walks through how to build a method that takes a single integer as an argument and builds a sum
# of all of the integers counting up to the argument value.
#
# https://www.youtube.com/watch?v=vEIah6upXC8&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=20

def sum_generator(num) = (1..num).sum

p sum_generator(10)

describe '#sum_generator' do
  it 'Outputs a sum of digits, ranging from 0 through the argument value' do
    expect(sum_generator(10)).to eq(55)
  end
end
