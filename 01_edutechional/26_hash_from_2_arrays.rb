# frozen_string_literal: true

require 'rspec'

# This coding exercise examines how to build a method that takes in two arrays and outputs a hash where one array makes
# up the keys and the other array makes up the values.
#
# https://www.youtube.com/watch?v=jbLDUv0-Fbg&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=27

# transpose - https://docs.ruby-lang.org/en//3.3/Array.html#method-i-transpose
def title_builder(headers, data) = [headers, data].transpose.to_h

# zip - https://docs.ruby-lang.org/en//3.3/Array.html#method-i-zip
# def title_builder(headers, data) = headers.zip(data).to_h

arr1 = %w[title description rating]
arr2 = ['Fountainhead', 'Novel about unique perspectives', 5]

p title_builder(arr1, arr2)

describe '#title_builder' do
  it 'combines two arrays to generate a hash' do
    expect(title_builder(arr1, arr2)).to eq(
      { 'title' => 'Fountainhead', 'description' => 'Novel about unique perspectives', 'rating' => 5 }
    )
  end
end
