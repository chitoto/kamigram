class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @accounts = User.all
  end

  def new
    if params[:back]
      @account = User.new(feed_params)
    else
      @account = User.new
    end
  end

  def create
    @account = User.new(user_params)
    if @account.save
      redirect_to user_path(@account.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @account.update(user_params)
      redirect_to users_path, notice: "アカウントを編集しました！"
    else
      render :edit
    end
  end

  def confirm
    @account = current_user.users.build(user_params)
    if @account.invalid?
      redirect_to new_user_path, flash: { error: @account.errors.full_messages }
    end
  end

  def destroy
    @account.destroy
    redirect_to users_path, notice:"アカウント削除しました！"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :image, :image_cache)
  end

  def set_user
    @account = User.find(params[:id])
  end
end
