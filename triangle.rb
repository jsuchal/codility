# http://stackoverflow.com/a/7139391/233852

def triangle(a)
  a.sort!
  a.each_cons(3) do |a, b, c|
    next if c <= 0
    return 1 if a + b > c
  end
  0
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 0, triangle([10, 50, 5, 1])
  end

  def test_success
    assert_equal 1, triangle([10, 2, 5, 1, 8, 20])
  end

  def test_success2
    assert_equal 1, triangle([10,0, -10, 2, 5,5, 1, 8, 20])
  end

  def test_large2
    assert_equal 1, triangle([1] + 20.step(100_000, 2).to_a + [1, 5, 10])
  end
end
