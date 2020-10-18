module UsersHelper
  def article_lists(articles)
    html = ''
    articles.each do |article|
      html += render(partial: 'article',locals: { article: article })
    end
    return raw(html)
  end

  def question_lists(questions)
    html = ''
    questions.each do |question|
      html += render(partial: 'questions/question',locals: { question: question })
    end
    return raw(html)
  end
end
