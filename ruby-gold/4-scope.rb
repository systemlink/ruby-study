class A
  private
  def private_foo; puts "private-foo"; end

  protected
  def protected_foo; puts "protected-foo"; end
end
A.new.private_foo rescue puts($!) # => 例外
A.new.protected_foo rescue puts($!) # => 例外

class B < A
  def foo
    private_foo
  end
end
B.new.foo # => private-foo

class C < A
  def foo
    protected_foo
  end
end
C.new.foo # => protected-foo

class D < A
  def foo
    self.private_foo
  end
end
D.new.foo rescue puts($!) # => 例外

class E < A
  def foo
    self.protected_foo
  end
end
E.new.foo # => protected-foo

class F < A
  def initialize(obj)
    obj.private_foo
  end
end
F.new(A.new) rescue puts($!) # => 例外

class G < A
  def initialize(obj)
    obj.protected_foo
  end
end
G.new(A.new) # => protected-foo
