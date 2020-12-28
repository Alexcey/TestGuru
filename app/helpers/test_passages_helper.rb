module TestPassagesHelper
  def test_complete_message(test_passage)
    if (test_passage.success?)
      "<p>Successfully. Your score is: <span style='color: green'>#{test_passage.finish_percent}%</span</p>".html_safe
    else
      "<p>Failed. Your score is: <span style='color: red'>#{test_passage.finish_percent}%</span></p>".html_safe
    end
  end

  def progress_bar(test_passage)
    progress_percent = test_passage.current_question_number.to_f/test_passage.test.questions.size * 100
    progress_percent.round
  end
end
