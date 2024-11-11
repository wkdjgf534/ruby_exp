# frozen_string_literal: true

require 'rspec'

# This exercise asks you to replicate the functionality of the popular image_tag method
# provided by the Ruby on Rails framework.
#
# https://www.youtube.com/watch?v=67u9-myQIyk&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=37

image_path = 'https://devcamp.com/some_pic.jpg'

def image_tag(image_path, **options)
  str = "<img src='#{image_path}'"

  options.map { |attr, value| str << " #{attr}='#{value}'" } unless options.empty?

  str << '>'
end

p image_tag(image_path)

p image_tag(image_path, test: 'rest', alt: 'Some text')

describe '#image_tag' do
  it 'generates an HTML link' do
    expect(image_tag(image_path)).to eq("<img src='https://devcamp.com/some_pic.jpg'>")
  end

  it 'generates an HTML link' do
    expect(image_tag(image_path, width: 42)).to eq("<img src='https://devcamp.com/some_pic.jpg' width='42'>")
  end

  it 'generate an HTML link and can optionally take n alt tag' do
    expect(image_tag(image_path, width: 42, alt: 'My Image'))
      .to eq("<img src='https://devcamp.com/some_pic.jpg' width='42' alt='My Image'>")
  end

  it 'generates an HTML link and can optionally take any type of attributes tag' do
    random = rand(100)
    expect(image_tag(image_path, random_value: random))
      .to eq("<img src='https://devcamp.com/some_pic.jpg' random_value='#{random}'>")
  end
end
