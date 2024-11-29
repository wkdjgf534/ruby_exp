# frozen_string_literal: true

require 'rspec'

# In this guide we'll walk through how to split a nested array based on a conditional equation into two arrays.
#
# https://www.youtube.com/watch?v=8K-mZz2KV3w&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=66

LIMIT = 300

invoice = Struct.new(:title, :total, :category)
google = invoice.new('Google', 500, 'SEM')
facebook = invoice.new('Facebook', 1000, 'Social')
linked_in = invoice.new('LinkedIn', 200, 'Socials')
invoices = [google, facebook, linked_in]

# partition - https://ruby-doc.org/3.3.6/Enumerable.html#method-i-partition
def invoice_filter(invoices) = invoices.map(&:total).partition { |i| i > LIMIT }

p invoice_filter(invoices)

describe '#invoice_filter' do
  it 'splits invoices over 300' do
    expect(invoice_filter(invoices).first).to eq([500, 1000])
    expect(invoice_filter(invoices).last).to eq([200])
  end
end
