# frozen_string_literal: true

require 'rspec'

# In this guide, we'll walk through how to generate the Fibonacci sequence in the Ruby programming language.
#
# https://www.youtube.com/watch?v=88UgrxXDMcU&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=57

def fibonacci(num) = num.times.inject([0, 1]) { |fib| fib << fib.last(2).sum }

p fibonacci(10)

describe '#fibonacci' do
  it 'properly calculates the fibonacci value' do
    expect(fibonacci(10)).to match_array([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89])
  end
end
