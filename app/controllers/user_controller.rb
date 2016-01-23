class UserController < ApplicationController
  def signup
  end

  def create
    user = User.new
    if params[:password] == params[:passwordRepeat]
      user[:name] = params[:username]
      user[:password] = Digest::SHA1.hexdigest params[:password]
      user[:email] = params[:email]
      user.save
      flash[:success] = "Thank you for registration"
    else
      #flash[:error] = "Password should match"
      redirect_to "/user/signup", :flash => {:error => "Password should match"}
    end
  end

  def signin
    @user = User.where(:name => params[:username]).first
    if (@user = User.where(:name => params[:username]).first) && Digest::SHA1.hexdigest(params[:password]) == @user.password
      #flash[:success] = "you are in"
      @products = Product.all
      session[:user_id] = @user.id
    else
      redirect_to action: "signup", :flash => {:error => "I don't know you"} 
    end
       
  end

  def signout
    if session[:user_id]
      session[:user_id] = nil
    end
    redirect_to root_path
  end
end
