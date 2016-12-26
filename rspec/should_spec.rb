=begin
Hoge
  .foo
    should eq 4
    should not eq 3
  #foo
    should eq 3
    should not eq 4

Finished in 0.00218 seconds (files took 0.18304 seconds to load)
4 examples, 0 failures
=end
describe Hoge do
  describe '.foo' do
    subject { Hoge.foo }
    it { should eq 4 }
    it { should_not eq 3 }
  end

  describe '#foo' do
    subject { Hoge.new.foo }
    it { should eq 3 }
    it { should_not eq 4 }
  end
end
