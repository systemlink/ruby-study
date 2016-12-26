p Rational.superclass # => Numeric
p Complex.superclass # => Numeric
p Fixnum.superclass # => Integer
p Bignum.superclass # => Integer
p Integer.superclass # => Numeric
p Float.superclass # => Numeric
p Numeric.superclass # => Object

val = "あいうえお"
p val.encoding # => <Encoding:UTF-8>
val.encode!("windows-31j")
p val.encoding # => <Encoding:Windows-31J>
p '100' == 100 # => false
p '100' >= 100 rescue p $!
  # => <ArgumentError: comparison of String with 100 failed>
p 'aabbccddeeffgg'.delete('a-f', 'd-g')
  # => "aabbccgg"（すべてに一致する文字を削除した結果）

p Array.new(3, Object.new).map(&:object_id)
  # => [70107518952160, 70107518952160, 70107518952160]
  # 全部同じobject
