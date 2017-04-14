get '/like/:question_id' do

  question_id = params[:question_id]
  p question_id
  p "en like question"
  #@question = Question.find(question_id)
  # @question.update(vote_like: (@question.vote_like + 1))
  ##@question_val = Question.all.order(:id)
  @user_login = current_user.name
  @question = Question.all
  quest_vote = QuestionVote.new(question_id:question_id, like: 1, unlike: 0, user_id: current_user.id)
  if quest_vote.save
  	erb :secret
  end
end

get '/unlike/:question_id' do

  question_id = params[:question_id]
  p question_id
  p "en UNlike question"
  #@question = Question.find(question_id)
  # @question.update(vote_like: (@question.vote_like + 1))
  ##@question_val = Question.all.order(:id)
  @user_login = current_user.name
  @question = Question.all
  quest_vote = QuestionVote.new(question_id:question_id, like: 0, unlike: 1, user_id: current_user.id)
  if quest_vote.save
  	erb :secret
  end
end