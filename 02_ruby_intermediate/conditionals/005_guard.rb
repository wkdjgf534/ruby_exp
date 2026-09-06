# frozen_string_literal: true

bad_slug = 'This is a bad $lug'
good_slug = 'This is a good slug'

def conver_to_slug(str)
  return "Sorry, that's not valid" if str.include?('$')

  str.tr(' ', '-').downcase
end

puts conver_to_slug(bad_slug)
puts conver_to_slug(good_slug)
