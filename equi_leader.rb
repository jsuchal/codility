def leader(a)
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

  [count, candidate] # we asume there is a leader
end

def equi_leader(a)
  total_leaders, leader = leader(a)

  equi_leaders = 0

  left_leaders = 0
  right_leaders = total_leaders

  a.each_with_index do |item, i|
    if item == leader
      left_leaders += 1
      right_leaders -= 1
    end

    equi_leaders += 1 if left_leaders > (i + 1) / 2.0 && right_leaders > (a.size - i - 1) / 2.0
  end

  equi_leaders
end


require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 2, equi_leader([4, 3, 4, 4, 4, 2])
  end
end



