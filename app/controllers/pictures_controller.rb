class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]
  before_action :ensure_user, only: %i[edit update destroy]
  def index
    @pictures = Picture.all.order(created_at: :desc)
  end

  def new
    @picture = Picture.new
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path, notice: "投稿しました!"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to picture_path(@picture.id), notice: "pictureを編集しました!"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    flash[:danger] = "pictureを削除しました!"
    redirect_to pictures_path
  end

  private
  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def ensure_user
    redirect_to pictures_path unless @picture.user.id == current_user.id
  end
end
