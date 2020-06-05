class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  # { user: {family_name: "gamezcua1", password: "contraseña"}  }
  def create
    @user = User.find_by(family_name: params.dig(:user, :family_name))

    if @user&.authenticate(params.dig(:user, :password)) && !@user.blocked?
      session[:user_id] = @user.id

      flash[:success] = "you have successfully logged in"
      redirect_to root_path
    else
      flash[:warning] = "Incorrect username or password"

      flash[:warning] = "Your user is blocked" if @user.blocked?
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
