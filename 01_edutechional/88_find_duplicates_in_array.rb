# frozen_string_literal: true

require 'rspec'
require 'date'

# When it comes to Ruby programming, Ruby has a helpful method for removing duplicates from an array, the uniq method.
# However, there are times when you simply want to know which elements in Ruby arrays are duplicates.
# In this guide we will add a method to the Array class that returns all duplicates.
#
# https://www.youtube.com/watch?v=gxyXDWOFXLg&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=94

invoices = [
  { company: 'Google', amount: 500, date: Date.new(2017, 1, 1).to_s, employee: 'Jon Snow' },
  { company: 'Yahoo', amount: 500, date: Date.new(2017, 1, 1).to_s, employee: 'Jon Snow' },
  { company: 'Google', amount: 500, date: Date.new(2017, 1, 1).to_s, employee: 'Jon Snow' },
  { company: 'Google', amount: 500, date: Date.new(2015, 7, 31).to_s, employee: 'Jon Snow' },
  { company: 'Google', amount: 500, date: Date.new(2017, 1, 1).to_s, employee: 'Jon Snow' },
  { company: 'Google', amount: 500, date: Date.new(2017, 1, 1).to_s, employee: 'Jon Snow', notes: 'Some notes' },
].freeze

# Standard Ruby Array class
class Array
  def find_duplicates = select.with_index { |elem, ind| ind != index(elem) }
end

p invoices.find_duplicates

describe '.find_duplicates' do
  it 'returns all duplicates of an array of integers' do
    ints = [1, 2, 3, 4, 1]
    expect(ints.find_duplicates).to match_array([1])
  end

  it 'returns all duplicates of an array of hashes' do
    expect(invoices.find_duplicates)
      .to match_array([
                        { company: 'Google', amount: 500, date: Date.new(2017, 1, 1).to_s, employee: 'Jon Snow' },
                        { company: 'Google', amount: 500, date: Date.new(2017, 1, 1).to_s, employee: 'Jon Snow' }
                      ])
  end
end
