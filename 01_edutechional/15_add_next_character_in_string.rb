# frozen_string_literal: true

require 'rspec'

# In this Ruby coding exercise you'll learn how to add the next element in a sequence of numbers or letters
#
# https://www.youtube.com/watch?v=s2iSmKPECHA&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=16

# succ - https://docs.ruby-lang.org/en//3.3/String.html#method-i-succ-21
def increment_value(str) = "#{str}#{str[-1].succ}"

p increment_value('abcd')

describe '#increment_value' do
  it 'appends the next item in the sequence of a string' do
    expect(increment_value('abcde')).to eq('abcdef')
    expect(increment_value('123')).to eq('1234')
  end
end
