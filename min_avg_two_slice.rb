def min_avg_two_slice(a)
  minimum = (a[0] + a[1]) / 2.0
  minimum_position = 0

  a.each_cons(2).each_with_index do |pair, position|
    average = pair.inject(:+) / 2.0
    if minimum > average
      minimum = average
      minimum_position = position
    end
  end

  a.each_cons(3).each_with_index do |triple, position|
    average = triple.inject(:+) / 3.0

    if minimum == average && minimum_position > position || minimum > average
      minimum = average
      minimum_position = position
    end
  end

  minimum_position
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, min_avg_two_slice([4, 2, 2, 5, 1, 5, 8])
  end

  def test_example_input2
    assert_equal 3, min_avg_two_slice([4, 2, 2, -1000, 1, -3, -3])
  end

  def test_negative
    assert_equal 2, min_avg_two_slice([-10, 100, -5, -3, -4, -4])
  end

  def test_double_quadruple
    assert_equal 0, min_avg_two_slice([-10000, -10000])
  end

  def test_simple1
    assert_equal 5, min_avg_two_slice([10, 10, -1, 2, 4, -1, 2, -1])
  end

  def test_simple2
    assert_equal 2, min_avg_two_slice([-3, -5, -8, -4, -10])
  end

  def test_small_random
    assert_equal 17, min_avg_two_slice([9330, -1185, -9851, 8220, 8786, 1645, 3431, -8322, 5330, -5264, -9384, 5776, -3078, 2466, 2316, -7029, -6339, -7712, -9708, -265, 9298, -8709, 822, -682, 2029, -8222, 1580, -4609, 1129, 2893, -379, -2895, -5017, 8671, -932, 603, -9614, 162, -9885, -7125, -543, -2453, -8917, 1751, -6720, 1147, -7115, 8747, 5420, 9139, -7176, -3892, -9209, -4465, 6131, -6453, -6909, 9095, -6909, 6678, -9179, -2276, -3008, -3166, 6330, -481, 5658, -583, 6347, 7632, -1208, 5622, 6295, -4087, -7523, -6288, -1279, -7611, 596, 6589, -296, 6355, 3128, 2821, -3093, 4053, 6199, -6857, 8160, -4614, -6903, 6810, 4403, 5872, -1067, -8585, -2095, -9046, -4278, -9241])
  end

  def test_medium_range
    assert_equal 3, min_avg_two_slice([-3, -3, 10, -10, 10, -10, 10, -10, 10, -3, -3, 100, -11])
  end

  def test_earlier_triple_is_better
    assert_equal 0, min_avg_two_slice([-2, -1, -3, 5, 5, -4, 0])
  end
end
