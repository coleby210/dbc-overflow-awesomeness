# comments.rb

# Controller for comments
# different form for comments on Questions vs Answers

get '/comments/new/question/:id' do #get create form
  @question = Question.find(params[:id])
  if !logged_in?
    redirect '______'
  else
    @user_id = session[:id]
    erb :'comment/new_comment_to_question'
  end
end




get '/comments/new/answer/:id' do #get create form
  @answer = Answer.find(params[:id])
  if !logged_in?
    redirect '______'
  else
    @user_id = session[:id]
    erb :'comment/new_comment_to_answer'
  end
end

post '/comments' do
end
