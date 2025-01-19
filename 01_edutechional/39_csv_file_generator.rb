# frozen_string_literal: true

require 'rspec'
require 'csv'

# This coding exercise will walk through how you can build a CSV file generator that will allow you to export data
# that can be viewed in applications such as Negrosoft Excel.
#
# https://www.youtube.com/watch?v=Ts4nyoDfvHo&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=43

headers = %w[Name Title Email]
crm_data = [
  ['Darth Vader', 'CEO', 'betterthan@theforce.com'],
  ['Luke Skywalker', 'Dev', 'daddy@issues.com'],
  ['Kylo Ren', 'COO', 'daaddy2@issues.com']
]

def csv_tool(headers, data)
  CSV.open('support/generated_file.csv', 'wb') do |csv|
    csv << headers

    data.each { csv << it }
  end
end

p csv_tool(headers, crm_data)

describe '#csv_tool' do
  it 'create a csv file with the correct headers and rows' do
    test_csv_file = File.read('support/crm.csv').gsub(/\r\n?/, '\n')
    csv_tool(headers, crm_data)
    generated_file = File.read('support/generated_file.csv')

    expect(generated_file).to eq(test_csv_file)
  end
end
