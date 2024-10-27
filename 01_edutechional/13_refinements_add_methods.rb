# frozen_string_literal: true

require 'rspec'

# This coding exercise will teach you how to use Refinements in Ruby in order to add custom
# functionality to specific classes.
#
# https://www.youtube.com/watch?v=FkSkV-4QX0k&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=14

# Refinement
module RubyContent
  refine String do
    def commentize
      "# #{self}"
    end
  end
end

# ContentController
class ContentController
  using RubyContent

  def initialize(word)
    @word = word
  end

  def hidden_content
    @word.commentize
  end
end

p ContentController.new('My string').hidden_content

describe 'ContentController' do
  it '#hidden_content' do
    cc = ContentController.new('My String')
    expect(cc.hidden_content).to eq('# My String')
  end
end
