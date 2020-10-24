module TestPassagesHelper
  def test_complete_message(test_passage)
    if (test_passage.success?)
      'You have successfully passed the Test'
    else
      'You did not pass the Test'
    end
  end

  def colored_result(test_passage)
    color = test_passage.success? ? 'green' : 'red'
    "<span style='color: #{color}'>
    #{test_passage.success_percent}</span>".html_safe
  end
end
