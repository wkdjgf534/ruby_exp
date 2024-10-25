# frozen_string_literal: true

require 'rspec'

# In this coding exercise you'll learn how to build a currency converter method in Ruby,
# including how to utilize advanced string interpolation.
#
# https://www.youtube.com/watch?v=Vg7zYxSSXzU&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=10

def currency_converter(amount, location)
  case location
  when 'US'
    format('$%.2f', amount)
  when 'Japan'
    format('¥%.0f', amount)
  when 'UK'
    format('£%.2f', amount).tr('.', ',')
  end
end

puts currency_converter(5000, 'Ses')

describe '#currency_converter' do
  it 'can properly format currency for US, Japan, and UK' do
    expect(currency_converter(5000, 'US')).to eq('$5000.00')
    expect(currency_converter(5000, 'Japan')).to eq('¥5000')
    expect(currency_converter(5000, 'UK')).to eq('£5000,00')
  end
end
