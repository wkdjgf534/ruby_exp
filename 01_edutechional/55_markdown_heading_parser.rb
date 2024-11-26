# frozen_string_literal: true

require 'rspec'

# This guide examines how to parse a Ruby Heredoc object and convert any lines with a hashtag to HTML H1 headings.
#
# https://www.youtube.com/watch?v=2m156CiTyNs&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=59

content = <<~STR
  # Hey there

  Some content

  # Another heading

  More content
STR

def markdown_heading_parser(content)
  content.gsub(/^.*#.*/) { |heading| "<h1>#{heading[2..]}</h1>" }
end

p markdown_heading_parser(content)

describe '#markdown_heading_parser' do
  it 'converts a markdown strings to HTML' do
    expect(markdown_heading_parser(content)).to include('<h1>Hey there</h1>')
    expect(markdown_heading_parser(content)).to include('More content')
  end
end
