# frozen_string_literal: true

require 'rspec'

# This guide explains how to validate the length of every element in an Array in Ruby.
#
# https://www.youtube.com/watch?v=Slm3_kB1y6o&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=64

arr_one = %w[words that have size requirements]
arr_two = %w[words that nave not all 4 chatacters long]

# Standard Ruby Array class
class Array
  def at_least_four_characters? = all? { it.length >= 4 }
end

p arr_one.at_least_four_characters?
p arr_two.at_least_four_characters?

describe '.at_least_four_characters?' do
  it 'checks if an array contains elements that atr all at least 4 characters long' do
    expect(arr_one.at_least_four_characters?).to be_truthy
    expect(arr_two.at_least_four_characters?).to be_falsey
  end
end
