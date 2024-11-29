# frozen_string_literal: true

require 'rspec'

# In this guide we'll walk through how to count the number of items filtered in a Ruby array.
#
# https://www.youtube.com/watch?v=pypdqGclskE&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=65

array = [100, 2, 5, 10, 11]

def greater_than_10(arr) = arr.count { |num| num > 10 }

p greater_than_10(array)

describe '#greater_than_10' do
  it 'count how many elements are greater than 10' do
    expect(greater_than_10(array)).to eq(2)
  end
end
