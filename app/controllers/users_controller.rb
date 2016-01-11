class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to links_path
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
