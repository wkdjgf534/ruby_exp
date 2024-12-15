# frozen_string_literal: true

require 'active_support/core_ext/hash'
require 'active_support'
require 'rspec'

# In the last guide I implemented an XML parser that counted all of the lines from Shakespeare's Macbeth play.
# That implementation worked, however it used an iterative approach, which resulted in a highly coupled method that
# would only be able to work on another XML file if it had an identical structure and set of tag names.
# In this guide we're going to refactor the solution to utilize a functional approach.
#
# https://www.youtube.com/watch?v=gvd87pfHU7c&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=89

def macbeth_counter
  xml_data = File.open('support/macbeth.xml')
  unwrap_xml(xml_data)
    .group_by { |speaker, _| speaker }
    .transform_values { |value| value.map(&:last).sum }
end

def unwrap_xml(data)
  Enumerator.new do |y|
    Hash.from_xml(data)['PLAY']['ACT'].each do |k|
      k['SCENE'].each do |k2|
        k2['SPEECH'].each do |k3|
          y << [k3['SPEAKER'], Array(k3['LINE']).size]
        end
      end
    end
  end
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
