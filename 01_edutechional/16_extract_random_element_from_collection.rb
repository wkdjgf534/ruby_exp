# frozen_string_literal: true

require 'rspec'

# This coding exercise walks through how to work with the Hash data structure in Ruby. Specifically, you will learn how
# to select a random element from a set of nested arrays inside of a hash.
#
# https://www.youtube.com/watch?v=LzbYNN48JZg&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=18

menu = {
  'appetizers': %w[Chips flatbread Quesadillas],
  'entrees': %w[Steak Chicken Lobster],
  'desserts': %w[Cheesecake Cake Cupcake]
}

def daily_special(menu) = menu.values.flatten.sample

p daily_special(menu)

describe 'Nested hash element selector' do
  it 'selected a random element form the set of nested arrays' do
    expect(daily_special(menu).class).to eq(String)
  end
end
