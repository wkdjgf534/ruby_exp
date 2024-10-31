# frozen_string_literal: true

require 'rspec'

# In this coding exercise you'll re-create the reverse method in Ruby. You are required to build a method that reverses
# the characters in a string and returns the reversed values.
#
# https://www.youtube.com/watch?v=kW68Qcb6f0c&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=25

str = 'Hi there'

# Standard Ruby String class
class String
  def alt_reverse
    return self if length <= 1

    reversed_string = ''
    string_length = length - 1
    (0..string_length).reverse_each { |char| reversed_string += self[char] }

    reversed_string
  end
end

p str.alt_reverse

describe '.alt_reverse' do
  it 'reverses the letters of a string without using the reverse method' do
    expect('Hi there'.alt_reverse).to eq('ereht iH')
  end
end
