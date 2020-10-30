class SearchQuestionsService
  def self.search(search)
    if search != ''
      Question.where('text LIKE(?)', "%#{search}%")
    else
      Question.all
    end
  end
end
