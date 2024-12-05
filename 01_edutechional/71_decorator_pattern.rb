# frozen_string_literal: true

require 'rspec'
require 'date'
require 'delegate'

# There are a number of ways to implement the decorator design pattern in the Ruby programming language.
# In this guide we're going to examine how we can leverage the SimpleDelegator tool in Ruby to add additional
# functionality to a class when performing software development.
#
# https://www.youtube.com/watch?v=EHgET-LUwGQ&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=77

class Invoice
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def invoice_date
    Date.new(1989, 9, 19)
  end

  def invoice_month
    invoice_date.month
  end
end

class InvoiceDecorator < SimpleDelegator
  def invoice_month
    invoice_date.month
  end

  def last_name
    name.split.last
  end
end

invoice = Invoice.new('Peter Doe')
decorated_invoice = InvoiceDecorator.new(invoice)

p invoice
p decorated_invoice.invoice_month
p decorated_invoice.last_name

describe '#decorated_invoice' do
  it 'can take an invoice as an argument and add functionality om top of the class' do
    expect(decorated_invoice.invoice_month).to eq(9)
  end

  it 'can work with data from the class' do
    expect(decorated_invoice.last_name).to eq('Doe')
  end

  it 'can access the decorated object' do
    expect(decorated_invoice.__getobj__).to eq(invoice)
  end
end
