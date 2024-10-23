# frozen_string_literal: true

require 'rspec'

# In this coding exercise we'll walk through how to properly create a palindrome method in Ruby,
# including a discussion on working with case insensitive comparisons.
#
# https://www.youtube.com/watch?v=Dmd7BJ0t5RE&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=7

def palindrome?(word) = word.downcase == word.downcase.reverse

p palindrome?('tacocat')

describe '#palindorme?' do
  it 'returns true if the word is a palindrome, false if not' do
    expect(palindrome?('tacocat')).to be_truthy
    expect(palindrome?('Tacocat')).to be_truthy
    expect(palindrome?('baseball')).to be_falsey
  end
end
