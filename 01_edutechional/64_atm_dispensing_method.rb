# frozen_string_literal: true

require 'rspec'

# This guide walks through how to build out the common Ruby coding interview question: how to build out
# an ATM dispensing method.
#
# https://www.youtube.com/watch?v=DUq2K3eTVk8&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=68

def atm(total, denominations)
  denominations.each_with_object({}) do |denomination, hash|
    hash[denomination], total = total.divmod(denomination)
  end
end

p atm(245, [100, 20, 10, 1])

describe '#atm' do
  it 'dispenses the correct denominations to users' do
    expect(atm(110, [100, 20, 10, 5])).to eq({ 100 => 1, 20 => 0, 10 => 1, 5 => 0 })
    expect(atm(245, [20, 10, 5])).to eq({ 20 => 12, 10 => 0, 5 => 1 })
  end
end
