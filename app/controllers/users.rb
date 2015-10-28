require "byebug"

get '/' do #at the landing page

  erb :"/static/index"
end

get "/signup" do #takes users from the landing page to the signup page

  erb :"signup_page"
end

post "/signup" do #create a user
    user_exists = User.find_by(user_email: params[:user][:user_email])
  
  if user_exists.nil?
    user = User.new(
      user_full_name: params[:user][:user_full_name], 
      user_password: params[:user][:user_password], 
      user_email: params[:user][:user_email], 
      self_description: params[:user][:self_description]
      ) 
    url.save
    redirect to "/login"

  else 
    redirect to "/login"
  end
end

get "/login" do #show the login page
  
  erb :"login_page"
end

post "/login" do #submit details to compare to the table info

erb :"login_page"
end
