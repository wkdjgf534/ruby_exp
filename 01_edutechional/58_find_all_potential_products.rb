# frozen_string_literal: true

require 'rspec'

# This guide examines how to properly find the full set of potential products in a Ruby collection.
#
# https://www.youtube.com/watch?v=3GF8NrX66OM&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=62

def mod_checker(arr, num1, num2) = arr.select { |mod| (mod % num1).zero? && (mod % num2).zero? }

p mod_checker(1..200, 12, 16)

describe '#mod_checker' do
  it 'returns all values divisible by 12 and 16' do
    expect(mod_checker(1..200, 12, 16)).to match_array([48, 96, 144, 192])
  end

  it 'returns all values divisible by 200 and 73' do
    expect(mod_checker(1..120_000, 200, 73))
      .to match_array([14_600, 29_200, 43_800, 58_400, 73_000, 87_600, 102_200, 116_800])
  end
end
