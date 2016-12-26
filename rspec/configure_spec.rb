RSpec.configure do |c|
  # RSpec初回ロード時に呼び出し
  c.before(:suite) { puts "===> suite" }
  # 各RSpecファイル読み込み時に呼び出し
  c.before(:all) { puts "===> all" }
  # 各テストごとに呼び出し
  c.before(:each) { puts "===> each" }
end

=begin
===> suite

configure
===> all
  １個目
===> each
    should eq 1
===> each
    should not eq 2
  ２個目
===> each
    should not eq 1
===> each
    should eq 2

Finished in 0.00241 seconds (files took 0.18058 seconds to load)
4 examples, 0 failures
=end
describe 'configure' do
  subject { @value }

  describe '１個目' do
    before { @value = 1 }
    it { should eq 1 }
    it { should_not eq 2 }
  end

  describe '２個目' do
    before { @value = 2 }
    it { should_not eq 1 }
    it { should eq 2 }
  end
end
