module B
end

B::A = Class.new # OK

B::A::A = 1 # OK

B::B = 1 # OK

B::B::A = 1 # error
