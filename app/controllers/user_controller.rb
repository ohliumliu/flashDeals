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
      UserMailer.welcome_email(user).deliver
    else
      #flash[:error] = "Password should match"
      redirect_to "/user/signup", :flash => {:error => "Password should match"}
    end
  end

  def signin
    @products = Product.all
    @user = User.where(:name => params[:username]).first
    if (@user = User.where(:name => params[:username]).first) && Digest::SHA1.hexdigest(params[:password]) == @user.password
      session[:user_id] = @user.id
      flash[:success] = session[:user_id] 

      respond_to do |format|
        #format.html
        format.json {render json: @user}
      end

    else
      #redirect_to action: "signup", :flash => {:error => "I don't know you"} 
    end

       
  end

  def signout
    if session[:user_id]
      session[:user_id] = nil
    end
    redirect_to root_path
  end
end
