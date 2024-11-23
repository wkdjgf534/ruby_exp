# frozen_string_literal: true

require 'rspec'

# In this guide we'll examine how to remove all of the vowels from an array in Ruby by leveraging regular expressions.
#
# https://www.youtube.com/watch?v=ORcFSwVYqX8&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=53

alphabet = ('a'..'z')

def vowel_remover(alphabet) = alphabet.grep(/[^aeoiu]/)

p vowel_remover(alphabet)

describe '#vowel_remover' do
  it 'removes vowels from the alphabet' do
    expect(vowel_remover(alphabet)).not_to include('a')
    expect(vowel_remover(alphabet)).not_to include('i')
  end
end
