# frozen_string_literal: true

require 'rspec'

# In this guide you'll learn how to find divisible numbers by leveraging Ruby's detect method.
#
# https://www.youtube.com/watch?v=R8VHPUXcUb0&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=60

strings = %w[a small group of words that are variable length]

# max_by - https://ruby-doc.org/3.3.6/Enumerable.html#method-i-max_by
def largest_words(strings, num) = strings.max_by(num, &:length)

p largest_words(strings, 3)

describe '#largest_words' do
  it 'returns the largest words from an array' do
    expect(largest_words(strings, 3)).to match_array(%w[variable length words])
  end
end
