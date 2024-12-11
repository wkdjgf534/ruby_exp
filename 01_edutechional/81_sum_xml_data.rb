# frozen_string_literal: true

require 'active_support/core_ext/hash'
require 'active_support'
require 'rspec'

# When it comes to working with APIs, two of the most common tools that you will use are JSON and XML.
# In this guide we'll walk through a challenging task in which we ingest the full play of Shakespeare's Macbeth in XML
# and convert it into a hash that sums the total number of lines for each character in the play.
#
# https://www.youtube.com/watch?v=2OggjW1g3dk&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=88

def macbeth_counter
  xml_data = File.open('support/macbeth.xml')
  hash = Hash.from_xml(xml_data)

  counter_hash = Hash.new { |h, k| h[k] = 0 }

  hash['PLAY']['ACT'].each do |k|
    k['SCENE'].each do |k2|
      k2['SPEECH'].each do |k3|
        counter_hash[k3['SPEAKER']] += Array(k3['LINE']).size
      end
    end
  end

  counter_hash
end

p macbeth_counter

describe '' do
  it 'can count the lines in macbeth for each character' do
    expect(macbeth_counter['ROSS']).to eq(135)
    expect(macbeth_counter['Macbeth'])
  end

  it 'produces a full line count for each character' do
    expect(macbeth_counter).to include({ 'First Witch' => 62 })
  end
end
