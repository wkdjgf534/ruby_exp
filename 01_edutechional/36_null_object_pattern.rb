# frozen_string_literal: true

require 'rspec'

# This coding exercise will test your ability to implement a basic version of the Null Object Pattern in Ruby.
#
# https://www.youtube.com/watch?v=lMswd2pbQUQ&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=39

# Null Class
class NullClass
  def method_missing(_name, *_args, &_block) = self

  def respond_to_missing?(name, include_private = false) = name.to_s || super
end

null = NullClass.new
p null.respond_to?(:something)
p null.anything('hey')

describe 'Null Class' do
  it 'returns NullClass object for standard method calls even when not defined' do
    expect(null.something).to eq(null)
  end

  it 'returns true when asked if it responds to non existent methods' do
    expect(null.respond_to?(:something)).to eq(true)
  end

  it 'returns NullClass for method calls with arguments, even when not defined' do
    expect(null.anything('hey')).to eq(null)
  end

  it 'returns NullClass for method calls with a block, even when not defined' do
    expect(null.anything { 2 * 2 }).to eq(null)
  end
end
