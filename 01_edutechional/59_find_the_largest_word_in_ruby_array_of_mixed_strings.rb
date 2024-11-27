# frozen_string_literal: true

require 'rspec'

# This guide describes how to find the largest word in a Ruby array filled with mixed strings.
#
# https://www.youtube.com/watch?v=nUundtgBb7w&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=63

arr = ['A sentence', 'broken into several', 'array elements']

# Standard Ruby Array class
class Array
  def largest_word = flat_map(&:split).max_by(&:length)
end

p arr.largest_word

describe '.largest_word' do
  it 'returns the longest word from an array' do
    expect(arr.longest_word).to eq('sentence')
  end
end
