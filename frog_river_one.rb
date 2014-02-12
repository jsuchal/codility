def solution(x, a)
  seen = {}

  a.each_with_index do |position, time|
    seen[position] = true if position <= x
    return time if seen.size == x
  end

  -1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 6, solution(5, [1, 3, 1, 4, 2, 3, 5, 4])
  end

  def test_no_jump
    assert_equal -1, solution(5, [1,2,4,5,6,7,8])
  end

  def test_exact_jump
    assert_equal 0, solution(1, [1])
  end
end
