# frozen_string_literal: true

def html_printer(&block)
  puts '<html>'
  puts "\t<body>"

  yield block # puts code from block

  puts "\t</body>"
  puts '</html'

  yield block # puts code from block again
end

html_printer do
  puts "\t\t<h3>Title: My Title</h3>"
  puts "\t\t<p>My great post content</p>"
end
