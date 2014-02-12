def max_counters(n, a)
  counters = Array.new(n, 0)
  maximum_value = 0
  last_maximize = 0
  a.each do |x|
    if x <= n && x >= 1
      counter = counters[x - 1]
      counter = last_maximize if counter < last_maximize
      counters[x - 1] = counter + 1
      maximum_value = counter + 1 if counter + 1 > maximum_value
    elsif x == n + 1
      last_maximize = maximum_value
    end
  end

  counters.map do |i|
    i < last_maximize ? last_maximize : i
  end
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal [3, 2, 2, 4, 2], max_counters(5, [3, 4, 4, 6, 1, 4, 4])
  end

  def test_empty
    assert_equal [0,0,0,0,0], max_counters(5, [])
  end

  def test_one_maximize
    assert_equal [0,0,0,0,0], max_counters(5, [6])
  end

  def test_one_increment_and_maximize
    assert_equal [1,1,1,1,1], max_counters(5, [3,6])
  end
end
