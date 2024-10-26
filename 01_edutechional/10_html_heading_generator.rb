# frozen_string_literal: true

require 'rspec'

# In this Ruby coding exercise you'll learn how to build an HTML H1 heading generator that takes in
# a title and outputs a full HTML title.
#
# https://www.youtube.com/watch?v=L33W3Mp5f3c&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=11

def title_creator(title, tag) = format('<%<first_tag>s>%<title>s</%<last_tag>s>', begin: tag, title:, end: tag)

p title_creator('test', 'h1')

describe '' do
  it 'outputs an h1 tag given a title' do
    expect(title_creator('A Heading', 'h1')).to eq('<h1>A Heading</h1>')
  end
end
