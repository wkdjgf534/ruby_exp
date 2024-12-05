# frozen_string_literal: true

require 'rspec'

# Ruby offers a wide variety of solutions for many tasks. In this guide we're going to explore a more expressive
# process for querying hashes by leveraging the fetch method.
#
# https://www.youtube.com/watch?v=zrAQxmLD4jo&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=78

hash = { name: 'Peter', email: 'ttest@example.com' }

def hash_query(hash, key) = hash.fetch(key)

p hash_query(hash, :name)

describe '#hash_query' do
  it 'properly retrieves a value given a key' do
    expect(hash_query(hash, :name)).to eq('Peter')
  end

  it 'throws an error when a key is requested that does not exist in the hash' do
    expect { hash_query(hash, :username) }.to raise_error(KeyError)
  end
end
