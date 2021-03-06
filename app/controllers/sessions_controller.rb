class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    puts user.inspect

    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
      puts user
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
