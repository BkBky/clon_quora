get "/show_users" do
  @users = User.all
  erb :all_users
end

#update user 
get "/update/:id" do

  @edit = User.find(params[:id])
  # @edit_tags = @edit.tags
  erb :update_profile
end

post "/update/:id" do
 p "esta en post update"
 user = User.find(params[:id])
 values = []
 p name = params[:name]
 p email = params[:email]
 p password = params[:password]
 if password != ""
   p "hola estoy vacio"
   user.update(name: name, email: email, password: password)
 else
   user.update(name: name, email: email)
 end
 # user_up.each do |key, value|
 	
 #   if key == "name" and "email" and "password"
 #   	  p value
   	 
   	
   
 

 #      # user.update(name: name, email: email, password: password)
 #   end
 # end
 # p user.update(params[:post])
 

 # user.update(params[])
end