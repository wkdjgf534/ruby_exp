# frozen_string_literal: true

require 'rspec'

# This coding exercise will test your ability to work with various data structures while performing mathematical
# calculations as you build a dynamic multiplication table generator in Ruby.
#
# https://www.youtube.com/watch?v=XfUfouesnfk&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=30

def multiplication_table(num)
  hash = {}
  selected_range = 1..10
  1.upto(num) { |i| hash[i] = selected_range.map { |res| res * i } }

  hash
end

p multiplication_table(3)

describe '#multiplication_table' do
  it 'create a hash base multiplication table' do
    hash = {
      1 => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      2 => [2, 4, 6, 8, 10, 12, 14, 16, 18, 20],
      3 => [3, 6, 9, 12, 15, 18, 21, 24, 27, 30]
    }.freeze

    expect(multiplication_table(3)).to eq(hash)
  end
end
