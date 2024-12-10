# frozen_string_literal: true

require 'rspec'

# Parsing file types can be a complex process. However, by leveraging the grep method you can leverage regular
# expressions to quickly return a full list of all of the file types that you're searching for.
#
# https://www.youtube.com/watch?v=5XqQ-jfSFww&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=84

file_names = %w[file1.rb file2.html file3.rb file4.rb file5.js]

# Standard Ruby Array class
class Array
  def file_selector(ext) = grep(/(.*)\.#{ext}/) { ::Regexp.last_match(1) }
end

p file_names.file_selector('html')

describe '.file_selector' do
  it 'returns the ruby file name from an array of file names' do
    expect(file_names.file_selector('rb')).to eq(%w[file1 file3 file4])
  end
end
