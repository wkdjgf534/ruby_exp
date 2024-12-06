# frozen_string_literal: true

require 'rspec'
require 'date'

# Working with dates in web applications can pose a unique challenge, especially when working with multiple
# date formats. This guide focuses on how to convert string based strings in a specific format into a Ruby
# date object so that you can utilize it in your own program
#
# https://www.youtube.com/watch?v=ptjfVjp6Bwk&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=79

str_date = '07/31/2018'

def date_parser(str) = Date.strptime(str, '%m/%d/%Y')

p date_parser(str_date)

describe 'Date parser' do
  it 'converts a string formatted as mm/dd/yyyy into a date object' do
    expect(date_parser(str_date).class).to eq(Date)
    expect(date_parser(str_date).month).to eq(7)
    expect(date_parser(str_date).leap?).to eq(false)
  end
end
