get '/questions/new' do
  @question = Question.new

  if request.xhr?
    erb :"/questions/_new_question_partial", layout: false
  else
    erb :"/questions/_new_question_partial"
  end
end

post '/questions' do
  @question = Question.new(params[:question])

  if request.xhr?
    if @question.save
      p "^" * 80
      p @question
      p "^" * 80

      erb :"/questions/_each_question_partial", layout: false, locals: {question: @question}
    else
      erb :"/questions/_show"
    end
  else
    erb :"/questions/_each_question_partial"
  end
end
