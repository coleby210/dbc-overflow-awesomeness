get "/users/new" do
  if logged_in?
    @user = User.find(session[:id])
    redirect "/users/#{@user.id}"
  else
    erb :"/users/new"
  end
end

post "/users" do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])

  if @user.save
    login(@user)
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    "User already exists."
  end

end

get "/users/:id" do
  # @viewing_user = User.find(params[:id])
  # @logged_in_as = User.find(login(@viewing_user)) if login(@viewing_user)
  @user = User.find(params[:id])
  @logged_in_as = User.find(@user) if login(@user)
  @session_user = User.authenticate(params[:email], params[:password])

  if logged_in? && "#{current_user.id}" == params[:id]
    erb :"/users/show"
  else
    @errors = @user.errors.full_messages
    "You cannot view an account that's not yours!!!"
  end

end

get "/users/:id/edit" do
  # @viewing_user = User.find(params[:id])
  # @logged_in_as = User.find(login(@viewing_user)) if login(@viewing_user)
  if logged_in? && "#{current_user.id}" == params[:id]
  # if logged_in? && @session_user == @user
    erb :"/users/edit"
  else
    "You cannot edit an account that's not yours!!!"
  end
end

put "/users/:id" do
  # @viewing_user = User.find(params[:id])
  # @logged_in_as = User.find(login(@viewing_user)) if login(@viewing_user)
  @user = User.find(session[:id])
  @session_user = User.authenticate(params[:email], params[:password])

  if logged_in? && "#{current_user.id}" == params[:id]
    @user.update_attributes(first_name: params[:first_name])
    @user.update_attributes(last_name: params[:last_name])
    @user.update_attributes(email: params[:email])
    @user.update_attributes(password: params[:password])
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    "You cannot edit an account that's not yours!!!"
  end
end

delete "users/:id" do
  # @viewing_user = User.find(params[:id])
  # @logged_in_as = User.find(login(@viewing_user)) if login(@viewing_user)
  @user = User.find(params[:id])

  if logged_in? && "#{current_user.id}" == params[:id]
    @user.destroy
    logout!
    redirect '/'
  else
    @errors = @user.errors.full_messages
    "You cannot delete an account that's not yours!!!"
  end
end
