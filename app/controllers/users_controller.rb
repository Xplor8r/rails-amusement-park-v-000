class UsersController < ApplicationController
  before_action :user
  skip_before_action :user, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @message = params[:message]
    @message ||= false
  end

  def edit
  end

  def create
    @user = User.create(user_params)
    if !@user.save
      render :new
    else
      notice: "Welcome to the theme park!"
      redirect_to user_path(@user)
      @user = User.find(params[:id])
    end
  end

  def update
      if @user.update(user_params)
        notice: 'User was successfully updated.'
        redirect_to user_path(@user)
      else
        render :edit
        redirect_to controller: 'users', action: 'edit'
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :tickets, :height, :nausea)
  end
<<<<<<< HEAD

  def user
    @user = User.find(params[:id])
  end
=======
>>>>>>> e8377532b7eb71ab9d63994d832d74e2b92e9d61
end
