# http://codereview.stackexchange.com/a/34081

def solution(a, b)
  flowing_down = []
  survivors = 0

  a.zip(b).each do |size, direction|
    if direction == 0 # flowing upstream
      if flowing_down.empty?
        survivors += 1
      else
        # duel
        while flowing_down.any?
          if size > flowing_down.last
            flowing_down.pop
          else
            break
          end
          survivors += 1 if flowing_down.empty?
        end
      end
    else
      flowing_down << size
    end
  end
  survivors + flowing_down.size
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 2, solution([4, 3, 2, 1, 5], [0, 1, 0, 0, 0])
  end
end
