# frozen_string_literal: true

require 'rspec'

# This coding exercise will walk through how to work with CSV files and convert a file's content into Ruby collections
# that you can utilize.
#
# https://www.youtube.com/watch?v=fiGTJMFpaFo&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=44

def csv_parser(file_path) = File.read(file_path).split(/\n/).map { |line| line.split(',') }

p csv_parser('support/crm.csv')

describe '#csv_parser' do
  it 'parses a CSV file and stores data in an array' do
    final_data = [
      %w[Name Title Email],
      ['Darth Vader', 'CEO', 'betterthan@theforce.com'],
      ['Luke Skywalker', 'Dev', 'daddy@issues.com'],
      ['Kylo Ren', 'COO', 'daaddy2@issues.com']
    ]

    expect(csv_parser('support/crm.csv')).to eq(final_data)
  end
end
