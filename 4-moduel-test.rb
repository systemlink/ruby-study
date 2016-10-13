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

puts "----- 1"
puts A.new.foo # A-foo
puts B.new.foo # B-foo
p B.ancestors # [B A Object Kernel BasicObject]

module C
  def self.foo
    "C-self-foo"
  end
end

module D
  extend C

  def self.foo
    "D-self-foo"
  end
end

module E
  def self.foo
    "E-self-foo"
  end

  extend C
end

module F
  include C
  def self.foo
    "F-self-foo"
  end
end

# モジュール
puts "----- 2"
puts C.foo # C-self-foo
puts D.foo # D-self-foo
puts E.foo # E-self-foo
puts F.foo # F-self-foo
p D.ancestors # [D]
p F.ancestors # [F, C]

module G
  def foo
    "G-foo"
  end
end

module G2
  include G
  def foo
    "G2-foo"
  end
end

class H
  include G # インスタンスメソッド
  def foo
    "H-foo"
  end
end

class H2 < H
  def foo
    "H2-foo"
  end
end

class I
  extend G # クラスメソッド
  def foo
    "I-foo"
  end
end

# 自分 < mixin(include)の継承元 < 継承の継承元 < 継承 < mixin(include) < Object < Kernel < BasicObject
class J < H2
  include G2
  # extend G2 継承はancestorsで表示されない
end

puts "----- 1"
puts H.new.foo # H-foo
puts I.new.foo # I-foo
puts I.foo # G-foo
p I.ancestors # [I, Object, Kernel, BasicObject]
p J.ancestors # [J, G2, H2, H, G, Object, Kernel, BasicObject]
puts J.new.foo # G2-foo
