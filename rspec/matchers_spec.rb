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

  describe '#foo?' do
    it { expect(Hoge.new).to be_foo }
  end
end
