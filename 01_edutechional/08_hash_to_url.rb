# frozen_string_literal: true

require 'rspec'

# This coding exercise walks through how to convert a Ruby hash to a URL friendly string,
# including how to organize the parameters.
#
# https://www.youtube.com/watch?v=olE5K0w44H0&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=8

hash = { topic: 'basketball', team: 'test_team' }

# Standard Ruby Hash class
class Hash
  def param_converter = map { it * '=' } * '&'
end

p hash.param_converter

describe '.param_converter' do
  it 'Adds an HTML param converter to the Hash class' do
    expect(hash.param_converter).to eq('topic=basketball&team=test_team')
  end
end
