$:.push File.join(File.dirname(__FILE__), *%w[.. .. lib])
require 'spec/autorun'
require 'spec/test/unit'

class MyTest < Test::Unit::TestCase
  def should_pass_with_should
    1.should == 1
  end

  def should_fail_with_should
    1.should == 2
  end

  def should_pass_with_assert
    assert true
  end
  
  def should_fail_with_assert
    assert false
  end

  def test
    raise "This is not a real test"
  end

  def test_ify
    raise "This is a real test"
  end
end