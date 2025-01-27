class UserCalendarsController < ApplicationController
  before_action :authenticate_user! # ユーザーがログインしていない場合、ログインページにリダイレクト
  before_action :set_user_calendar, only: [:show, :edit, :update, :destroy, :share]

  def index
    @user_calendars = current_user.user_calendars
  end

  def show
    @user_calendar = UserCalendar.find(params[:id])
    @events = @user_calendar.events || [] # 空の配列を代入
  end

  def new
    @user_calendar = current_user.user_calendars.build
  end

  def create
    @user_calendar = current_user.user_calendars.build(user_calendar_params)
    if @user_calendar.save
      redirect_to @user_calendar, notice: 'カレンダーが作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user_calendar.update(user_calendar_params)
      redirect_to @user_calendar, notice: 'カレンダーが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @user_calendar.destroy
    redirect_to mypage_path, notice: 'カレンダーが削除されました。'
  end
  
  # カレンダーを共有する
  def share
    @user_calendar.update(shared: true, share_url: SecureRandom.hex(10))
    redirect_to @user_calendar, notice: 'カレンダーを共有しました。'
  end

  # 共有を解除する
  def unshare
    @user_calendar.update(shared: false, share_url: nil)
    redirect_to @user_calendar, notice: 'カレンダーの共有を解除しました。'
  end

  private

  def set_user_calendar
    @user_calendar = current_user.user_calendars.find(params[:id])
  end

  def user_calendar_params
    params.require(:user_calendar).permit(:title, :description)
  end
end
