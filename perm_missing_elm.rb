def perm_missing_elm(a)
  n = a.size
  sum = a.inject(0, :+)
  expected_sum = (2 + n) * (n + 1) / 2
  expected_sum - sum
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 4, perm_missing_elm([2, 3, 1, 5])
  end

  def test_empty
    assert_equal 1, perm_missing_elm([])
  end

  def test_odd
    assert_equal 3, perm_missing_elm([2, 4, 1, 5])
  end

  def test_odd2
    assert_equal 3, perm_missing_elm([2, 4, 1, 5, 6])
  end
end
