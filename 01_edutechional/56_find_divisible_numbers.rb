# frozen_string_literal: true

require 'rspec'

# In this guide you'll learn how to find divisible numbers by leveraging Ruby's detect method.
#
# https://www.youtube.com/watch?v=R8VHPUXcUb0&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=60

# detect - https://ruby-doc.org/3.3.6/Enumerable.html#method-i-detect
def mod_checker(arr, num1, num2) = arr.detect { (it % num1).zero? && (it % num2).zero? }

p mod_checker(1..200, 12, 16)

describe '#mod_checker' do
  it 'returns the first value divisible by 12 and 16' do
    expect(mod_checker(1..200, 12, 16)).to eq(48)
  end

  it 'returns the first value divisible by 200 and 73' do
    expect(mod_checker(1..120_000, 200, 73)).to eq(14_600)
  end
end
