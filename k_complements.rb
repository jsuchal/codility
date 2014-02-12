def k_complements(a, k)
  s = a.sort

  i = 0
  j = a.size - 1

  number_of_matches = 0

  while i < j
    sum = s[i] + s[j]
    if sum == k
      number_of_matches += 2
      i += 1
      j -= 1
    elsif sum < k
      i += 1
    else
      j -= 1
    end
  end

  number_of_matches
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 6, k_complements([0, -1, 3, 2, -5, 7], 2)
  end
end
