class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]
  before_action :set_user, only: %i[show destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "アカウント登録しました!"
    else
      render :new
    end
  end

  def show
    @pictures = Picture.where(user_id: @user.id).order(created_at: :desc)
  end

  def destroy
    @user.destroy
    flash[:danger] = "退会しました!"
    redirect_to new_session_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
