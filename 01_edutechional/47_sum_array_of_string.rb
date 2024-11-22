# frozen_string_literal: true

require 'rspec'

# This guide examines an efficient process for summing an array filled with string based integers in Ruby.
#
# https://www.youtube.com/watch?v=4OIqLdTFtbQ&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=51

def string_sum(nums) = nums.map(&:to_i).sum

p string_sum([1, 2, 3])

describe '#string_sum' do
  it 'sums an array of string based integers' do
    expect(string_sum('1'..'20')).to eq(210)
    expect(string_sum('100'..'1000')).to eq(495_550)
  end

  it 'sum an array of integers' do
    expect(string_sum(100..1000)).to eq(495_550)
  end
end
