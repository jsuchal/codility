def passing_cars(a)
  passing = 0
  easts = 0
  a.each do |direction|
    if direction == 0
      easts += 1
    else
      passing += easts
    end
    return -1 if passing > 1_000_000_000
  end
  passing
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 5, passing_cars([0, 1, 0, 1, 1])
  end

  def test_empty
    assert_equal 0, passing_cars([])
  end

  def test_max_billion
    #assert_equal -1, solution(...)
  end
end
