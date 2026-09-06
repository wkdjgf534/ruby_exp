# frozen_string_literal: true

class Array
  def add_hey = push('hey')

  # monkey patching
  def size = 'Oops'
end

p [2, 4, 2, 3].add_hey
p [2, 4, 2, 3].size

class MyClass
  def my_method = 'from my class'
end

class MyClass
  def my_method = 'Something else'
end

m = MyClass.new
p m.my_method # 'Something else'
