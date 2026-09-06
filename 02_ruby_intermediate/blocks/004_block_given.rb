# frozen_string_literal: true

def invoice_generator(invoice, total)
  puts "Invoice ID: #{invoice}"

  yield if block_given?

  puts "Total: #{total}"
end

def details
  puts 'Widget 1 - Software'
  puts 'Widget 2 - Service'
  puts 'Widget 3 - Computer'
end

def customer_information
  puts 'Customer: Company ABC'
end

invoice_generator(123, 900.00) do
  details
  customer_information
end
