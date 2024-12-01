# frozen_string_literal: true

require 'rspec'

# This guide examines how to find the range of values in an integer based array by returning an array that contains
# the high and low values.
#
# https://www.youtube.com/watch?v=S3EfpS8ZEIU&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=71

arr = [5, 1, 3, 11, 100, 23]

# Standard Ruby Array class
class Array
  def array_range_finder = minmax
end

p arr.array_range_finder

describe '.array_range_finder' do
  it 'returns an array with the high and low range' do
    expect(arr.array_range_finder).to eq(1, 100)
  end
end
