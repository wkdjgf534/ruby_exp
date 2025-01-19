# frozen_string_literal: true

require 'rspec'

# Build a program that utilizes regular expressions to extract specific set integers from a string in Ruby.
#
# https://www.youtube.com/watch?v=5RTdBBRwA8o&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=1

string_array = [
  'Web IconHTML & CSS100%',
  'Command LineLearn the Command Line100%',
  'Ruby IconRuby50%',
  'Rails IconLearn Ruby on Rails100%',
  'Git IconLearn Git100%',
  'SassLearn Sass20%',
  'JQuery IconjQuery1%',
  'Angular JSLearn AngularJS 1.X100%',
  'JavaScript IconLearn JavaScript55%'
].freeze

# scan - https://ruby-doc.org/3.3.6/String.html#method-i-scan
def string_parser(string_array) = string_array.map { it.scan(/\d+/).last.to_i }

p string_parser(string_array)

describe '#string_parser' do
  it 'can take a string and output the correct values' do
    expect(string_parser(string_array)).to match_array([100, 100, 50, 100, 100, 20, 1, 100, 55])
  end
end
