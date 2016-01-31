get "/questions" do
  @questions = Question.all
  erb :"/"
end
