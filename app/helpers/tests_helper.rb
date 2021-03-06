module TestsHelper
  
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def questions_count(test)
    test.questions.count
  end

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end
end
