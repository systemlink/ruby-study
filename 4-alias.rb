class Hoge
  def huga1; end
  def huga2; end
  alias :huga3 :huga2
  undef :huga2
end

p Hoge.instance_methods(false) # [:huga1, :huga3]
Hoge.new.huga3 # errorにならない
Hoge.new.huga2 # error
