class A
  def foo
    "A-foo"
  end
end

class B < A
  def foo
    "B-foo"
  end
end

puts A.new.foo # A-foo
puts B.new.foo # B-foo
p B.ancestors # [B A Object Kernel BasicObject]
