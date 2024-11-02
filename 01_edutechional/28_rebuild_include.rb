# frozen_string_literal: true

require 'rspec'

# This Ruby coding problem tests your ability to implement conditionals, work with user input,
# and generate random numbers.
#
# https://www.youtube.com/watch?v=d8acxpnidOo&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=28

arr = [2, 5, 100, 4]

# Standard Ruby Array class
class Array
  def does_it_have?(element)
    each { |i| return true if i == element }
    false
  end
end

p arr.does_it_have?(2)
p arr.does_it_have?(111)

describe '.does_it_have?' do
  it 'returns true if a supplied element is included in an array' do
    expect(arr.does_it_have?(5)).to be_truthy
    expect(arr.does_it_have?(20)).to be_falsey
  end
end
