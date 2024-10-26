# frozen_string_literal: true

require 'rspec'

# This coding exercise examines how to properly count the total number of words in Ruby. Additionally,
# we'll walk through how to breakdown the counts for each specific word in a string.
#
# https://www.youtube.com/watch?v=I988sReFcRM&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=13

str = '- The quick brown fox / jumped over the lazy FOX.'

# Standard Ruby String class
class String
  def total_words = scan(/\w+/).count

  def word_list
    list = Hash.new(0)
    downcase.scan(/\w+/) { |w| list[w] += 1 }
    list
  end
end

p str.total_words
p str.word_list

describe 'String word reporter' do
  describe '.total_words' do
    it 'counts words accurately' do
      expect(str.total_words).to eq(9)
    end
  end

  describe '.word_list' do
    it 'returns a hash that tootals up word usage' do
      expect(str.word_list)
        .to eq({ 'the' => 2, 'quick' => 1, 'brown' => 1, 'fox' => 2, 'jumped' => 1, 'over' => 1, 'lazy' => 1 })
    end
  end
end
