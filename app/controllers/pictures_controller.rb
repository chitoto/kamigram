class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:title_key]
      @pictures = Picture.where('title LIKE ?', "%#{params[:title_key]}%")
    else
      @pictures = Picture.all
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def new
    if params[:back]
     @picture = Picture.new(picture_params)
    else
     @picture = Picture.new
    end
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path, notice: "作成しました！"
      else
        flash.now[:notice] = '作成に失敗しました'
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"削除しました！"
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    @picture.id = params[:id]
    if @picture.invalid?
      redirect_to new_picture_path, flash: { error: @picture.errors.full_messages }
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:title, :content,:image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
