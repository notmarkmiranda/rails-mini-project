class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully Logged In!"
      redirect_to user
    else
      flash.now[:error] = "Invalid Credentials!"
      render :new
    end
  end

end
