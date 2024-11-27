class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'アカウントが作成されました。'
    else
      flash.now[:alert] = 'アカウント作成に失敗しました。'
      render :new
    end
  end

  def show
    @user = current_user
    @user_calendars = @user.user_calendars.includes(:events)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
end
