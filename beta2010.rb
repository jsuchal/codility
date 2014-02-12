def beta2010(a)
  changes = Hash.new {|h, k| h[k] = {:start => 0, :end => 0}}

  a.each_with_index do |radius, position|
    changes[position - radius][:start] += 1
    changes[position + radius][:end] += 1
  end

  pairs = 0
  active = 0

  sorted_changes = Hash[changes.sort]

  sorted_changes.each do |_, change|
    started = change[:start]
    ended = change[:end]
    pairs += started * active  + (started * (started - 1)) / 2
    active = active + started - ended
    return -1 if pairs > 10_000_000
  end

  pairs
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 11, beta2010([1, 5, 2, 1, 4, 0])
  end

  def test_empty
    assert_equal 0, beta2010([])
  end

  def test_disjunctive_disks
    assert_equal 0, beta2010([0, 0])
  end
end
