# frozen_string_literal: true

require 'rspec'

# This guide walks through how to work with the Fibonacci sequence and return the final from a list
# of Fibonacci numbers.
#
# https://www.youtube.com/watch?v=JhSgfJKYyR4&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=59

def nth_fibonacci(num) = num.times.inject([0, 1]) { |fib| fib << fib.last(2).sum }.last

describe '#nth_fibonacci' do
  it 'properly calculates the fibonacci value' do
    expect(nth_fibonacci(10)).to eq(89)
  end
end
