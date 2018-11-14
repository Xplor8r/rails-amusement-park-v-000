class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :user
  skip_before_action :user, only: [:new, :create]

=======
>>>>>>> e8377532b7eb71ab9d63994d832d74e2b92e9d61
  def new
    @user = User.new
  end

  def show
<<<<<<< HEAD
    @message = params[:message]
    @message ||= false
  end

  def edit
  end

  def create
    @user = User.create(user_params)
    if !@user.save
      render :new
=======
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  def create
    @user = User.create(user_params)
    if !@user.save
      redirect_to controller: 'users', action: 'new'
>>>>>>> e8377532b7eb71ab9d63994d832d74e2b92e9d61
    else
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def update
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
<<<<<<< HEAD
        render :edit
=======
        redirect_to controller: 'users', action: 'edit'
>>>>>>> e8377532b7eb71ab9d63994d832d74e2b92e9d61
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
