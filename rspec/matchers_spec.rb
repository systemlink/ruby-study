=begin
RSpec::Matchers
  #be_empty
    should be empty
    should not be empty
  #be_a_kind_of
    should be a kind of Fixnum
    should be a kind of Numeric
  #be_an_instance_of
    should not be an instance of Numeric
    should be an instance of Fixnum
  #have_key
    should have key :a
    should not have key :b
  Hoge
    #foo?
      should be foo
    #be_truthy
      should be truthy
    #be_falsey
      should not be falsey
    #be_nil
      should be nil

Finished in 0.00818 seconds (files took 0.13331 seconds to load)
12 examples, 0 failures
=end
describe RSpec::Matchers do
  describe '#be_empty' do
    it { expect([]).to be_empty }
    it { expect(["test"]).to_not be_empty }
  end

  describe '#be_a_kind_of' do
    # 親クラスも見る
    it { expect(3).to be_a_kind_of(Fixnum) }
    it { expect(3).to be_a_kind_of(Numeric) }
  end

  describe '#be_an_instance_of' do
    # 親クラスは見ない
    it { expect(3).to_not be_an_instance_of(Numeric) }
    it { expect(3).to be_an_instance_of(Fixnum) }
  end

  describe '#have_key' do
    it { expect(a: 'A').to have_key(:a) }
    it { expect(a: 'B').to_not have_key(:b) }
  end

  describe Hoge do
    subject { Hoge.new }
    describe '#foo?' do
      it { should be_foo }
    end

    describe '#be_truthy' do
      it { expect(subject.foo).to be_truthy }
    end

    describe '#be_falsey' do
      it { expect(subject.foo).to_not be_falsey }
    end

    describe '#be_nil' do
      it { expect(subject.nil).to be_nil }
    end
  end
end
