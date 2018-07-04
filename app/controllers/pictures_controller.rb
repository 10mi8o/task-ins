class PicturesController < ApplicationController

before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_path, notice:'投稿が完了しました'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: '投稿の編集が完了しました'
    else
      render 'edit'
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: '投稿を削除しました'
  end


  private
  def picture_params
    params.require(:picture).permit(:title, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

end
