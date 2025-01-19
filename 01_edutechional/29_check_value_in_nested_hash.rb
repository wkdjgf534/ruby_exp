# frozen_string_literal: true

require 'rspec'

# This coding exercise extends our knowledge on the Hash data structure and walks through how to check and see
# if a value exists in any number of Hash collections nested inside an array.
#
# https://www.youtube.com/watch?v=XfUfouesnfk&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=30

books = [
  {
    title: 'Fontainhead',
    author: 'Ayn Rand'
  },
  {
    title: 'Deep Work',
    author: 'Cal Newport'
  }
].freeze

# Standard Ruby Array class
class Array
  def value_included?(value) = any? { it.value?(value) }
end

p books.value_included?('Deep Work')
p books.value_included?('Something Else')

describe '.value_included?' do
  it 'checks to see if a value is included in any number of hashess nested inside an array' do
    expect(books.value_included?('Deep Work')).to eq(true)
    expect(books.value_included?('Something Else')).to eq(false)
  end
end
