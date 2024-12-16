# frozen_string_literal: true

require 'rspec'

# Building a calculator is a popular interview question and a good approach for learning a programming language.
# In this guide we're going to build a Prefix Notation calculator in Ruby, which enables users to enter an operator,
# followed by any set of numbers to calculate.
#
# https://www.youtube.com/watch?v=w9zOuuuyb8k&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=91

def pn_calculator(str)
  values = str.split
  operator = values.shift

  begin
    raise PNError, 'Values need to be integers' unless values_are_integers?(values)
    raise PNError, 'Operator is not valid, needs to be +, -, *, /' unless operator_valid?(operator)
  rescue PNError => e
    return e
  end

  eval values.map(&:to_f).join(operator)
end

def values_are_integers?(arr) = arr.all?(/[0-9]/)

def operator_valid?(operator)
  %w[+ - * /].include?(operator)
end

class PNError < StandardError
  def initialize(msg = 'PN Error')
    super(msg)
  end
end

p pn_calculator('+ 0 5 1 9 11')

describe '#pn_calculator' do
  it 'can perform addition' do
    expect(pn_calculator('+ 2 2')).to eq(4)
    expect(pn_calculator('+ 0 5 1 9 11')).to eq(26)
  end

  it 'can perform subtraction' do
    expect(pn_calculator('- 2 2')).to eq(0)
    expect(pn_calculator('- 0 5 1 9 11')).to eq(-26)
  end

  it 'can perform multiplication' do
    expect(pn_calculator('* 2 2')).to eq(4)
    expect(pn_calculator('* 0 5 1 9 11')).to eq(0)
  end

  it 'can perfrom division' do
    expect(pn_calculator('/ 2 2')).to eq(1.0)
    expect(pn_calculator('/ 10 200')).to eq(0.05)
  end

  it 'returns an error if integers are not provided' do
    expect(pn_calculator('+ * 5').to_s).to eq('Values need to be integers')
    expect(pn_calculator('+ 10 b').to_s).to eq('Values need to be integers')
  end

  it 'returns an error if a proper operator is not provided' do
    expect(pn_calculator('l 0 5').to_s).to eq('Operator is not valid, needs to be +, -, *, /')
    expect(pn_calculator('x 0 5').to_s).to eq('Operator is not valid, needs to be +, -, *, /')
  end
end
