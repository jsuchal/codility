def tape_equllibrium(a)
  sum = a.inject(:+)
  minimum = nil
  p = 0
  sum_left = 0
  sum_right = sum
  begin
    sum_left += a[p]
    sum_right -= a[p]
    difference = (sum_left - sum_right).abs
    minimum = difference if !minimum || difference < minimum
    p += 1
  end while p + 1 < a.size

  minimum
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, tape_equllibrium([3, 1, 2, 4, 3])
  end

  def test_pair
    assert_equal 2000, tape_equllibrium([1000, -1000])
  end

  def test_negative
    assert_equal 3, tape_equllibrium([-10, -5, -3, -4, -5])
  end
end
