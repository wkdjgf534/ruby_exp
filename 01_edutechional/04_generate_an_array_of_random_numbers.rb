# frozen_string_literal: true

require 'rspec'

# Implement an Array generator that contains random numbers in a specific range.
#
# https://www.youtube.com/watch?v=LUh_OFFm3Jk&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=4

def random_numbers = Array.new(20).map { rand(9999) }

p random_numbers

describe '#random_numbers' do
  it 'creates a collection of random numbers ranging from 1 to 1000' do
    random_set_one = random_numbers
    random_set_two = random_numbers
    expect(random_set_one.size).to eq(20)
    expect(random_set_one).not_to match_array(random_set_two)
  end
end
