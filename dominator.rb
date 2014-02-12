def dominator(a)
  candidate = nil
  count = 0

  # majority vote algorithm
  a.each do |value|
    candidate = value if count == 0
    if candidate == value
      count += 1
    else
      count -= 1
    end
  end

  count = 0

  a.each do |value|
    count += 1 if value == candidate
  end

  (count > a.size / 2) ? candidate : -1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example
    assert_equal 3, dominator([3, 4, 3, 2, 3, -1, 3, 3])
  end

  def test_empty
    assert_equal -1, dominator([])
  end

  def test_no_major
    assert_equal -1, dominator([1, 1, 2, 2, 3, 3])
  end
end
