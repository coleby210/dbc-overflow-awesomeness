# answers.rb

# not yet needed - form is on the 'questions/show' erb
# get 'answers/new' do

# end

post '/answers' do
  answer = Answer.new(
    user_id: sessions[:id],
    question_id: params[:question_id],
    body: params[:body]
    )
  if answer.save
    redirect "/questions/#{params[:question_id]}"
  else
    erb :'derp'
  end
end
