module QuestionsHelper
  def question_lists(questions)
    html = ''
    questions.each do |question|
      html += render(partial: 'questions/question', locals: { question: question })
    end
    raw(html)
  end
end
