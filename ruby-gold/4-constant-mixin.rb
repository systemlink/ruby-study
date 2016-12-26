class Foo
  A = 1
end

module Bar
  A = 2
end

class FooExt < Foo
  include Bar
  p A # 2
end

class FooExt2 < Foo
  include Bar
  A = 3 # ワーニングがでない
  p A # 3
end

class FooExt3 < Foo
  include Bar
  A = 3 # ワーニングがでる
  A = 4 # ワーニングがでる
  p A # 4
end
