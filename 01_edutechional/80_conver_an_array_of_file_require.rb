# frozen_string_literal: true

require 'rspec'

# When building scripts, it's a common requirement to remove and update multiple items in a collection of strings.
# In this guide we're going to mimic the process needed to take a list of require statements and generate
# a list of file names.
#
# https://www.youtube.com/watch?v=YExA-ujTSJ4&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=86

javascript_files = [
  '//= require custom/scripts',
  '//= require base/defaults',
  '//= require html.sortable',
  '//= require moment',
  '//= require test-styles'
].freeze

def append_js_file_extension(required_files)
  # required_files.map { |file| file.gsub(%r{//= require }, '') }.map { |f| "#{f}.js" }
  required_files.map { |file| file.gsub(%r{//= require }, '') << '.js' }
end

p append_js_file_extension(javascript_files)

describe '#append_js_file_extension' do
  it 'convers require statements to javascript file name' do
    expect(append_js_file_extension(javascript_files))
      .to match_array(%w[custom/scripts.js base/defaults.js html.sortable.js moment.js test-styles.js])
  end
end
