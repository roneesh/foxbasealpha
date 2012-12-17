class SessionController < ApplicationController
  def new
  end

  def create
  
	@user = User.find_by_email(params[:email])
	    if @user && @user.authenticate(params[:password])
	      session[:user_id] = @user.id
	      flash[:message] = "Fox Base Alpha Connect Initiated"
	      redirect_to users_path
	    else
	      flash[:message] = "Invalid login e-mail or password"
	      redirect_to session_new_url
	    end

  end

  def destroy
  	session[:user_id] = nil #KILL THIS GODDAMN THING
    flash[:message] = "Fox Base Alpha Connect Terminated"
    redirect_to session_new_url
  end

end
