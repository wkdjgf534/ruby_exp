# frozen_string_literal: true

require 'rspec'

# This Ruby coding exercise walks through how to calculate leap years in Ruby,
# specifically how to list out all of the leap years in the 20th century.
#
# https://www.youtube.com/watch?v=y7A1fjSyKDc&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=7

years = *(1900..1999)

def leap_years(years)
  years.select do |year|
    year if (year % 4).zero? && year % 100 != 0 || (year % 400).zero?
  end
end

p leap_years(years)

describe '#leap_years' do
  it 'properly renders the leap years for the 20th century' do
    expect(leap_years(years)).to match_array([1904, 1908, 1912, 1916, 1920, 1924, 1928, 1932, 1936, 1940, 1944, 1948, 1952,
                                              1956, 1960, 1964, 1968, 1972, 1976, 1980, 1984, 1988, 1992, 1996])
  end
end
