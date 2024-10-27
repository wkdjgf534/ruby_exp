# frozen_string_literal: true

require 'rspec'

# In this coding exercise we'll walk through how to automatically generate the full alphabet in Ruby,
# without hard coding in the full set of letters
#
# https://www.youtube.com/watch?v=Nckc9YAbPKM&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=15

def generate_alphabet = ('a'..'z').to_a

p generate_alphabet

describe '#generate_alphabet' do
  it 'generates the full alphabet ' do
    arr = %w[a b c d e f]
    expect(generate_alphabet).to include(*arr)
  end
end
