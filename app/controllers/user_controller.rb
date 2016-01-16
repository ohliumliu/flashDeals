class UserController < ApplicationController
  def signup
  end

  def create
    user = User.new
    user[:name] = params[:username]
    user[:password] = params[:password]
    user.save
    flash[:success] = "Thank you for registration"
  end
  def signin
  end
end
