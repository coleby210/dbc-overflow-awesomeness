# votes.rb

post '/votes/new/question/:id/up' do #get create form
  @question = Question.find(params[:id])
  vote = Vote.new(positive: true, votable_type: "Question", votable_id: @question.id)
  if !logged_in?
    redirect '/sessions/new'
  else
    if request.xhr?
      if vote.save
        return vote
      end
    end
  end
end

post '/votes/new/question/:id/down' do #get create form
  @question = Question.find(params[:id])
 vote = Vote.new(positive: false, votable_type: "Question", votable_id: @question.id)
  if !logged_in?
    redirect '/sessions/new'
  else
    if request.xhr?
      if vote.save
        return vote
      end
    end
  end
end


post '/votes/new/answer/:id/up' do #get create form
  @answer = Answer.find(params[:id])
vote = Vote.new(positive: true, votable_type: "Answer", votable_id: @answer.id)
  if !logged_in?
    redirect '/sessions/new'
  else
    if request.xhr?
      if vote.save
        return vote
      end
    end
  end
end

post '/votes/new/answer/:id/down' do #get create form
  @answer = Answer.find(params[:id])
  vote = Vote.new(positive: false, votable_type: "Answer", votable_id: @answer.id)
  if !logged_in?
    redirect '/sessions/new'
  else
    if request.xhr?
      if vote.save
        return vote
      end
    end
  end
end

post '/votes' do

end

