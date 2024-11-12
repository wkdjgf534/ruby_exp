# frozen_string_literal: true

require 'rspec'
require 'date'

# The goal is to implement a method that returns an array with the full set of month names. However in order to properly
# build the solution you'll need to use the Ruby Date library
#
# https://www.youtube.com/watch?v=n08Ck0uWmzg&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=41

def months = Date::MONTHNAMES[1..12]

p months

describe '#months' do
  it 'returns the full list of months for a year as an array' do
    expect(months.size).to eq(12)
    expect(months).to include('February')
  end
end
