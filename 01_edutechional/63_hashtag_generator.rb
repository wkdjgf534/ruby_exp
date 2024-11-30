# frozen_string_literal: true

require 'rspec'

# This guide examines how you can open up the String class and convert all of the words in a sentence into hashtags
# that can be utilized via social media outlets.
#
# https://www.youtube.com/watch?v=Xk3aTrYawpg&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=67

str = 'fun words that need to be hashtags'

# Standard Ruby String class
class String
  def hashtag_generator = split.map { |word| "##{word}" }.join(' ')
end

p str.hashtag_generator

describe '.hashtag_generator' do
  it 'takes in a string and converts each word into a hashtag' do
    expect(str.hashtag_generator).to eq('#fun #words #that #need #to #be #hashtags')
  end
end
