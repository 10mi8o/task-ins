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
    @picture.user_id = current_user.id
    @picture.image.retrieve_from_cache!(params[:cache][:image]) if params[:cache][:image].present?
    if @picture.save
      ContactMailer.create_picture_mail(@picture).deliver
      redirect_to pictures_path, notice:'投稿が完了しました'
    else
      render 'new'
    end
  end

  def show
     @favorite = current_user.favorites.find_by(picture_id: @picture.id)
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
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: '投稿を削除しました'
  end

  private
  def picture_params
    params.require(:picture).permit(:title, :content, :image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

# 追記、検証箇所
  # def current_user
  #   unless current_user.id == @picture.user.id
  #     flash[:danger] = '権限がありません'
  #     redirect_back(fallback_location: picture_path(@picture))
  #   end
  # end

end
