# frozen_string_literal: true

require 'rspec'

# Working with multiline strings in Ruby used to result in very odd looking code because heredocs required that
# you shift all of the string code so it was flush against the left hand side of the file.
# However, with modern versions of Ruby you are now able to utilize the squiggly heredoc syntax, which allows you
# to indent multiline strings in a file
#
# https://www.youtube.com/watch?v=W6JhZwpExqk&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=81

def heredoc_refactor
  <<~STR
    Some
    words
    in a heredoc
  STR
end

puts heredoc_refactor

describe '#heredoc refactor' do
  it 'does not have leading spaces on each line' do
    expect(heredoc_refactor).to eq("Some\nwords\nin a heredoc\n")
  end
end
