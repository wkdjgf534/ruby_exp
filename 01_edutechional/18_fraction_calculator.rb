# frozen_string_literal: true

require 'rspec'

# In this exercise you'll learn how to effectively perform calculations on fractions in Ruby, including how you
# can build a method that returns a fraction
#
# https://www.youtube.com/watch?v=kg9KutIbnt4&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=19

def fraction_calculator(fraction_one, fraction_two, operator)
  result = Rational(fraction_one).public_send(operator.to_sym, Rational(fraction_two))
  result.to_s
end

p fraction_calculator('1/3', '2/4', '*')

describe '#fraction_calculator' do
  it 'can perform calculations on two fractions and output the value in a string based fraction format' do
    expect(fraction_calculator('1/3', '2/4', '*')).to eq('1/6')
    expect(fraction_calculator('1/3', '2/4', '/')).to eq('2/3')
    expect(fraction_calculator('1/3', '2/4', '+')).to eq('5/6')
    expect(fraction_calculator('1/3', '2/4', '-')).to eq('-1/6')
  end
end
