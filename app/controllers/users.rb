require "byebug"

get '/' do #at the landing page

  erb :"/static/index"
end

get "/signup" do #takes users from the landing page to the signup page

  erb :"signup_page"
end

post "/signup" do #create a user
  
  user_exists = User.find_by(email: params[:user][:email])
  
  if user_exists.nil?

    user = User.create(params[:user])
    @message = "Signed up. You may now login."
    # (
    #   user_full_name: params[:user][:user_full_name], 
    #   user_password: params[:user][:user_password], 
    #   user_email: params[:user][:user_email], 
    #   self_description: params[:user][:self_description]
    # ) 
    redirect to "/login"
  else
    @message = "Sign up failed"
  end
   redirect to "/login"  
end

get "/login" do #show the login page
  
  erb :"login_page"
end

post "/login" do #submit details to compare to the table info
user = User.authenticate(params[:user][:email], params[:user][:password])
session[:id] = user.id
erb :"/static/index"
end

post "/logout" do
  session[:id] = nil
  @message = "You have successfully logged out!"
erb :"static/index"  
end

get '/users/:id' do
end