class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if !@user.authenticate(params[:user][:password])
      redirect_to signin_path
    else
      session[:user_id] = @user.id
<<<<<<< HEAD
      redirect_to user_path(@user)
=======
      redirect_to user_path(@user), notice: "Welcome back to the theme park!"
>>>>>>> e8377532b7eb71ab9d63994d832d74e2b92e9d61
    end
  end

  def destroy
    session.clear
    redirect_to controller: 'static_pages', action: 'home'
  end
end
