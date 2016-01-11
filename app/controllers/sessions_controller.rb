class SessionsController < ApplicationController
  def new
  end

  def create
    if valid_user?
      session[:user_id] = @user.id
      redirect_to links_path
    else
      flash.now[:errors] = "Invalid login"
      render :new
    end
  end

  private

    def session_params
      params.require(:session).permit(:email, :password, :confirmation)
    end

    def valid_user?
      @user = User.find_by(email: session_params[:email])
      if session_params[:password] == session_params[:confirmation]
        @user && @user.authenticate(session_params[:password])
      else
        false
      end
    end
end
