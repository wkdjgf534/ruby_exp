# frozen_string_literal: true

require 'rspec'

# This guide walks through how to integrate Ruby modules in order to add custom helper methods to a class.
#
# https://www.youtube.com/watch?v=iP9qM8lqES4&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=73

module InvoiceHelper
  def taxable?(source)
    return true if %w[online AZ].include?(source)

    false
  end
end

class Sale
  include InvoiceHelper

  def initialize(total, source)
    @total = total
    @source = source
  end

  def place_order
    return (@total + (@total * 0.06)) if taxable?(@source)

    @total
  end
end

s = Sale.new(500, 'AZ')
p s.place_order

describe 'Tax helper' do
  it 'calculates the correct tax amount if source is online or AZ' do
    expect(s.place_order).to eq(530.0)
  end

  it 'ensures that an InvoiceHelper module has been included in the class' do
    expect((class << s; self; end).included_modules.first).to eq(InvoiceHelper)
  end
end
