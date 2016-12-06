module B
end

B::A = Class.new # OK

B::A::A = 1 # OK

B::B = 1 # OK

B::B::A = 1 # error

VAR = 1
class Foo
  VAR = 2
  def out1
    VAR
  end

  def out2
    ::VAR
  end

  def self.out3
    VAR
  end

  def self.out4
    ::VAR
  end

  def foo5
    VAR = 3
  end

  def self.foo6
    VAR = 4
  end
end

puts Foo.new.out1 # => 2
puts Foo.new.out2 # => 1
puts Foo.out3 # => 2
puts Foo.out4 # => 1
Foo.new.out5 # error
Foo.out6 # error
