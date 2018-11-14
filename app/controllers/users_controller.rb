class UsersController < ApplicationController
  before_action :user, only: [:show, :edit, :update, :destroy]

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
    if @user.save
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
      if @user.update(user_params)

        redirect_to user_path(@user)
      else
        render :edit
      end
  end

  private
    def user_params
      params.require(:user).permit(:name, :admin, :password, :happiness, :tickets, :height, :nausea)
    end

    def user
      @user = User.find(params[:id])
    end
end
