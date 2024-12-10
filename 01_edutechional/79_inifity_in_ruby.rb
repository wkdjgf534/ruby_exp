# frozen_string_literal: true

require 'rspec'

# Working with infinity can be a unique challenge in many different programming languages. Thankfully Ruby offers
# a helpful library that allows you to implement infinity into programs, and that's what this guide focuses on.
#
# https://www.youtube.com/watch?v=5dUBeOf00ok&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=86

def string_infinity_generator(num)
  return [''] if num.zero?

  arr = []

  (1..).each do |i|
    arr << i.to_s
    break if i == num
  end

  arr
end

p string_infinity_generator(5)

describe '#string_infinity_generator' do
  it 'returns an empty array when set 0' do
    expect(string_infinity_generator(0)).to match_array([''])
  end

  it 'returns an array of strings based integers from 1 to 5' do
    expect(string_infinity_generator(5)).to match_array(%w[1 2 3 4 5])
  end
end
