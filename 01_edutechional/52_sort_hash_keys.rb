# frozen_string_literal: true

require 'rspec'

# This guide walks through how to work with Ruby hashes, specifically how to sort through the keys by length.
#
# https://www.youtube.com/watch?v=XrXM19NMwew&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=56

collection = { first_key: 'Test value', some_key: 'Anything', 'string_key' => 'Anything', 8383 => 'Does not matter' }

def key_sorter(collection) = collection.keys.map(&:to_s).sort_by(&:length)

p key_sorter(collection)

describe '#key_sorter' do
  it 'sorts a set of hash keys by length' do
    expect(key_sorter(collection)).to match_array(%w[8383 some_key first_key string_key])
  end
end
