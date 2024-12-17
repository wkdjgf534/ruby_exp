# frozen_string_literal: true

require 'rspec'

# Building validations in programs is a common requirement. In this exercise we'll examine how to ensure a set of dice
# are valid by implementing a method that returns false if the dice are outside the range of 1-6.
#
# https://www.youtube.com/watch?v=DKMekPTB7DA&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=92

# Standard Ruby Array class
class Array
  def all_between?(top, bottom) = all? { |e| e.between?(top, bottom) }
end

def valid_dice?(num1, num2) = [num1, num2].all_between?(1, 6) ? true : false

p valid_dice?(1, 20)

describe '#valid_dice?' do
  it 'returns true if the dice are valid' do
    expect(valid_dice?(4, 2)).to be_truthy
    expect(valid_dice?(6, 6)).to be_truthy
    expect(valid_dice?(5, 1)).to be_truthy
  end

  it 'returns false if the dice are valid' do
    expect(valid_dice?(8, 2)).to be_falsey
    expect(valid_dice?(1, 7)).to be_falsey
    expect(valid_dice?(9, 7)).to be_falsey
  end
end
