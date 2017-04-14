

get '/show_question/:question_id' do
  question_id2 = params[:question_id]
  @quest_id = Question.where(id: question_id2)
  @user_login = current_user.name
  erb :show_question  
end




#Create a question on database
post '/create_question' do 
  question= params[:question]
  p quest  = Question.new(question: question, user_id: current_user.id)
  # Si el usuario se guardó en la DB, redirige a su perfil, de otra forma
  # vuelve a mostrar el formulario.
  if quest.save
    #I declare message for used, I can see it on view/layout
    session[:successfull] = 'Pregunta creada exitosamente.'
    redirect to '/secret'
  else
    session[:error] = 'No se creó tu pregunta, intenta de nuevo'
    redirect to '/secret'
  end
end

post '/create_answer/:id' do
  question_id3 = params[:id]
  answer = params[:answer]
  p question_id3
  p answer
  new_answer  = Answer.new(answer: answer, question_id: question_id3)
  if new_answer.save
    #I declare message for used, I can see it on view/layout
    session[:successfull] = 'Successfull answer created'
    redirect to "/show_question/#{question_id3}"
  else
    session[:error] = 'You couldn´t create and answer'
    redirect to "/show_question/#{question_id3}"
  end
end