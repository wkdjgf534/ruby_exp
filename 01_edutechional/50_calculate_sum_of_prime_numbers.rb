# frozen_string_literal: true

require 'rspec'
require 'prime'

# This guide walks through how to generate a sum of prime numbers in Ruby.
#
# https://www.youtube.com/watch?v=NZADunTO8HI&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=55

def prime_sum(num) = Prime.each(num).sum

p prime_sum(22)

describe '#prime_sum' do
  it 'sums the sequence of prime numbers' do
    expect(prime_sum(22)).to eq(77)
    expect(prime_sum(42)).to eq(238)
  end
end
