# frozen_string_literal: true

require 'rspec'
require 'date'

# This coding exercise focuses on how to perform date calculations. Specifically, you'll need to find the total
# number of days that have transpired between Christmas day in 2016 and July 1, 2004.
#
# https://www.youtube.com/watch?v=U2z_DMMmK14&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=38

def day_counter = (Date.new(2016, 12, 25) - Date.new(2004, 7, 1)).to_i

p day_counter

describe '#day_counter' do
  it 'counts the days between two dates' do
    expect(day_counter).to eq(4560)
  end
end
