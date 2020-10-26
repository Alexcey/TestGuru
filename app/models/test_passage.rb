class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def success?
    finish_percent >= SUCCESS_PERCENT
  end

  def finish_percent
    correct_questions * 100/test.questions.size
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    answer_ids ||= []
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
