# frozen_string_literal: true

require 'rspec'

# the task is to reverse the words in a string, where words are separated by one or more spaces
#
# https://www.youtube.com/watch?v=UfQ-wpaG1fI&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=2

def sentence_reverser(str) = str.split.reverse.join(' ')

p sentence_reverser('quick brown fox')

describe '#sentence_reverser' do
  it 'reverses the words in a sentence' do
    test_sentence = 'backwards am I'
    expect(sentence_reverser(test_sentence)).to eq('I am backwards')
  end
end
