def frog_jmp(x, y, d)
  # should probably use integer arithmetics w/ modulo, but this is quick'n'dirty
  ((y - x) / d.to_f).ceil
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 3, frog_jmp(10, 85, 30)
  end

  def test_no_jump_needed
    assert_equal 0, frog_jmp(10, 10, 30)
  end

  def test_exact_jump
    assert_equal 3, frog_jmp(0, 90, 30)
  end
end
