# frozen_string_literal: true

require 'rspec'

# This guide walks through how to build a breadcrumb generator that converts an array to a slash separated string.
#
# https://www.youtube.com/watch?v=AaByu6ti-Ls&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=55

items = ['String 1', 'String 2', 'String 3']

def breadcrumb_generator(strings) = strings.join(' / ')

p breadcrumb_generator(items)

describe '#breadcrumb_generator' do
  it 'converts an arrat of strings to breadcrumb' do
    expect(breadcrumb_generator(items)).to eq('String 1 / String 2 / String 3')
  end
end
