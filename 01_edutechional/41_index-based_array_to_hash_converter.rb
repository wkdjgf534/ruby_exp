# frozen_string_literal: true

require 'rspec'

# This coding exercise walks through how to build a method that converts an array to a hash, with the index value
# of the array elements becoming the hash keys and the values being the array elements
#
# https://www.youtube.com/watch?v=b-SM0X2-4sw&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=45

arr = %w[the quick brown fox]

# Standard Ruby Array class
class Array
  def index_hash = each_with_object({}) { |item, hash| hash[index(item)] = item }
end

p arr.index_hash

describe '.index_hash' do
  it 'converts an array to a hash' do
    expect(arr.index_hash).to eq({ 0 => 'the', 1 => 'quick', 2 => 'brown', 3 => 'fox' })
  end
end
