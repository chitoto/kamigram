class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def new
    if params[:back]
      @user = User.new(feed_params)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "アカウントを編集しました！"
    else
      render :edit
    end
  end

  def confirm
    @user = current_user.users.build(user_params)
    if @user.invalid?
      redirect_to new_user_path, flash: { error: @user.errors.full_messages }
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice:"アカウント削除しました！"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :image, :image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
