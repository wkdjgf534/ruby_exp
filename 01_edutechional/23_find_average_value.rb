# frozen_string_literal: true

require 'rspec'

# In this coding exercise you'll learn how to open the Array class and add an average method that finds
# the average value from an array of integers.
#
# https://www.youtube.com/watch?v=A46pExtcFqg&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=24

arr = [100, 50, 75]

# Standard Ruby Array class
class Array
  def average = sum / size
end

describe '' do
  it 'returns the average value from an array' do
    expect(arr.average).to eq(75)
  end
end
