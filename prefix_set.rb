def prefix_set(a)
  max_index = 0

  a.each_with_index do |item, i|
    # use sign on value index as flag for already seen
    value = item.abs
    if a[value] > 0 # if have never seen it we update max_index
      a[value] *= -1 # flip the "flag"
      max_index = i
    end
  end

  max_index
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 3, prefix_set([2, 2, 1, 0, 1])
  end
end