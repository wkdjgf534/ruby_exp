# frozen_string_literal: true

require 'rspec'

# This coding exercise walks through how to implement the Bubble Sort algorithm
# in Ruby and how to add it to the built in Array class.
#
# https://www.youtube.com/watch?v=olE5K0w44H0&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=8

hash = { topic: 'basketball', team: 'test_team' }

# Standard Ruby Hash class
class Hash
  def param_converter
    map { |i| i * '=' } * '&'
  end
end

p hash.param_converter

describe '' do
  it 'Adds an HTML param converter to the Hash class' do
    expect(hash.param_converter).to eq('topic=basketball&team=test_team')
  end
end
