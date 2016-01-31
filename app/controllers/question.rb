
get "/questions/:id" do
  @question = Question.find(params[:id])
  erb :"/questions/show"
end

# get '/questions/new' do
#   @question = Question.new

#   if request.xhr?
#     erb :"/questions/_new_question_partial", layout: false
#   else
#     erb :"/questions/_new_question_partial"
#   end
# end

# post '/questions' do
#   @question = Question.new(params[:question])

#   if request.xhr?
#     if @question.save
#       p "^" * 80
#       p @question
#       p "^" * 80

#       erb :"/questions/_each_question_partial", layout: false, locals: {question: @question}
#     else
#       erb :"/questions/_show"
#     end
#   else
#     erb :"/questions/_each_question_partial"
#   end
# end

get '/questions/new' do
  if !logged_in?
    redirect '/sessions/new'
  else
    @id = session[:id]
    erb :'question/new'
  end

end

# get inputs from form at 'questions/new.erb'
post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    erb :'question/new'
  end
end
