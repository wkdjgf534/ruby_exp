# frozen_string_literal: true

require 'rspec'

# We walk through how to map array data in Ruby, and specifically how we can build a method that takes in
# an unlimited number of arrays by leveraging the splat operator.
#
# https://www.youtube.com/watch?v=Cv3nMhKjH4U&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=3

headers = %w[1B 2B 3B SS C P LF CF RF]

astros = %w[Gurriel Altuve Bregman Coreea Gattis Keuchel Beltran Springer Reddick]

rangers = %w[Fielder Andrus Odor Beltre Lucroy Darvish Gomez Choo Mazara]

# zip - https://ruby-doc.org/3.3.6/Array.html#method-i-zip
def position_filter(headers, *data) = headers.zip(*data)

p position_filter(headers, astros, rangers)

describe '#position_filter' do
  it 'lines up player with their position' do
    test_headers = %w[1B 2B P]
    test_team = ['First Base Player', 'Second Base Player', 'Pitcher']
    expect(position_filter(test_headers, test_team).first).to eq(['1B', 'First Base Player'])
  end
end
