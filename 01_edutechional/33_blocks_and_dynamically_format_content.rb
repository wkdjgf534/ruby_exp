# frozen_string_literal: true

require 'rspec'

# This coding exercise will test your knowledge of how to use blocks in Ruby. Specifically, we'll walk through
# how to build a method that can take in a block as an argument and output an array of formatted values.
#
# https://www.youtube.com/watch?v=y0YnwFrHfhE&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=35

arr = %w[Altuve Correa Bregman]

def lineup_generator(list)
  return list unless block_given?

  list.map.with_index(1) { |player, index| yield(index, player) }
end

p lineup_generator(arr)

p lineup_generator(arr) { |x, y| "#{x}. #{y}" }

p lineup_generator(arr) { |x, y| "<p>#{x}</p> <div>#{y}</div>" }

describe '#lineup_generator' do
  it 'returns an entered array with block' do
    lineup = lineup_generator(arr)
    expect(lineup).to match_array(arr)
  end

  it 'can build a list driven lineup' do
    lineup = lineup_generator(arr) { |x, y| "#{x}. #{y}" }
    expect(lineup).to eq(['1. Altuve', '2. Correa', '3. Bregman'])
  end

  it 'can build an HTML driven lineup' do
    lineup = lineup_generator(arr) { |x, y| "<p>#{x}</p> <div>#{y}</div>" }
    expect(lineup).to eq(
      ['<p>1</p> <div>Altuve</div>',
       '<p>2</p> <div>Correa</div>',
       '<p>3</p> <div>Bregman</div>']
    )
  end

  it 'can build an HTML ul driven lineup' do
    lineup = lineup_generator(arr) { |_, y| "<li>#{y}</li>" }
    expect(lineup).to eq(['<li>Altuve</li>', '<li>Correa</li>', '<li>Bregman</li>'])
  end
end
