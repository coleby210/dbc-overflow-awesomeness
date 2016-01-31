get "/questions" do
  @questions = Question.all
  erb :"/"
end

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
