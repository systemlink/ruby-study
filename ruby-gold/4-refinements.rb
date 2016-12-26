class C
  def foo
    puts "C-foo"
  end

  def bar
    foo
  end
end

class D
end

module M
  refine C do
    def foo
      puts "C-foo in M"
    end
  end

  refine D do
    def foo
      puts "D-foo in M"
    end
  end
end

class E
  using M

  def bar
    C.new.foo
  end
end


E.new.bar # C-foo in M
C.new.foo # C-foo

using M

x = C.new
x.foo # C-foo
x.bar # C-foo in M
y = D.new
y.foo # D-foo in M
p C.ancestors # [C, Object, Kernel, BasicObject]
