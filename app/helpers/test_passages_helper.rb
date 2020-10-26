module TestPassagesHelper
  def test_complete_message(test_passage)
    if (test_passage.success?)
      "<p>Successfully. Your score is: <span style='color: green'>#{test_passage.finish_percent}%</span</p>".html_safe
    else
      "<p>Failed. Your score is: <span style='color: red'>#{test_passage.finish_percent}%</span></p>".html_safe
    end
  end
end
