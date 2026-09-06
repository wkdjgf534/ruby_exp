# frozen_string_literal: true

require 'ostruct'

class Invoice
  attr_reader :name, :location, :good_standing

  def initialize(name, location, good_standing)
    @name = name
    @location = location
    @good_standing = good_standing
  end

  def customer
    OpenStruct.new(name:, location:, good_standing:)
  end

  def method_missing(method_name, *args, &block)
    method_name.to_s =~ /customer_(.*)/ ? customer.send(::Regexp.last_match(1), *args, &block) : super
  end

  def respond_to_missing?(method_name, include_prvate = false) = method_name.to_s.start_with?('customer') || super
end

invoice = Invoice.new('Apple', 'Cupertino', true)
p invoice.customer_location
p invoice.respond_to?(:customer_location)

p invoice.customer_name
p invoice.respond_to?(:customer_name)
