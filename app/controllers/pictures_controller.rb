class PicturesController < ApplicationController

  def index
    @test = 'test'
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(title: params[:picture][:title], content:params[:picture][:content])
    redirect_to new_picture_path
  end
end
