# frozen_string_literal: true

require 'rspec'

# In this guide we'll examine how to implement the sort_by method in order to sort a collection of Ruby struct objects
# by a specific attribute
#
# https://www.youtube.com/watch?v=64pcebu-mJ4&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=49

def total_sorter(invoices) = invoices.sort_by(&:total).reverse

invoice = Struct.new(:name, :total, :category)
google = invoice.new('Google', 500, 'Marketing')
amazon = invoice.new('Amazon', 1000, 'eCommerce')
yahoo = invoice.new('Yahoo', 300, 'Marketing')
invoices = [google, amazon, yahoo]

p total_sorter(invoices)

describe '#total_sorter' do
  it 'sorts a set of invoices by their totals' do
    expect(total_sorter(invoices).first.name).to eq('Amazon')
    expect(total_sorter(invoices).last.name).to eq('Yahoo')
  end
end
