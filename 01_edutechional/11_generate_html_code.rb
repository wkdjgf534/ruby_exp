# frozen_string_literal: true

require 'rspec'

# In this coding exercise we'll examine how to leverage the Ruby Here Doc syntax to generate HTML with dynamic content.
#
# https://www.youtube.com/watch?v=ItnX2_KLyxQ&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=13

def html_generator(title)
  <<~HTML
    <!doctype html>

    <html lang="en">
      <head>
        <meta charset="utf-8">
        <title>#{title}</title>
      </head>

      <body>
      </body>
    </html>
  HTML
end

p html_generator('Test title')

describe '#html_generator' do
  it 'allows for a dynamic title' do
    expect(html_generator('My Site')).to match(/<title>My Site/)
  end
end
