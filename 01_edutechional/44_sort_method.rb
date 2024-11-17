# frozen_string_literal: true

require 'rspec'

# This guide walks through how to alter the built in Ruby sort method so that it forces a specific element
# to be placed at the end of a sorted array
#
# https://www.youtube.com/watch?v=GEZsVi3UvuU&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=48

def weird_alphabet
  ('a'..'z').sort { |l, r| l == 'k' ? 1 : l <=> r }
end

p weird_alphabet

describe '#weird_alphabet' do
  it 'create and sorts the alphabet, but places the letter k at the end' do
    expect(weird_alphabet.last).to eq('k')
    expect(weird_alphabet.first).to eq('a')
  end
end
