get '/profile' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  p "anest del @profile"
  p @profile_user = User.where(id: current_user.id)
  erb :profile
end


