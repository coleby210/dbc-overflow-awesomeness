# comments.rb

# Controller for comments
# different form for comments on Questions vs Answers

get '/comments/new/question/:id' do #get create form
  @question = Question.find(params[:id])
  if !logged_in?
    redirect '/sessions/new'
  else
    p "----" * 90
    @user_id = session[:id]
    erb :'comments/new_comment_to_question'
  end
end


get '/comments/new/answer/:id' do #get create form
  @answer = Answer.find(params[:id])
  if !logged_in?
    redirect '/sessions/new'
  else
    @user_id = session[:id]
    erb :'comments/new_comment_to_answer'
  end
end

# needs user login check
post '/comments' do
  puts "HEY LOOK HERE!!!"
  comment = Comment.new(
    user_id: session[:id],
    commentable_id: params[:commentable_id],
    commentable_type: params[:commentable_type],
    body: params[:body]
    )
  if comment.save
    if comment.commentable_type == 'Question'
      redirect "/questions/#{comment.commentable_id}"
    elsif comment.commentable_type == 'Answer'
      answer = Answer.find(comment.commentable_id)
      redirect "/questions/#{answer.question_id}"
    else
      erb :'derp'
    end
  else
    # back to form ideally, placeholder for now
    # IF/ELSE depending on on-comment or -on-answer
    erb :'derp'
  end
end
