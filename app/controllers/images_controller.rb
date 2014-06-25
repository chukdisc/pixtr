class ImagesController < ApplicationController
  def new
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
    @groups = Group.all
    @comment = Comment.new
    @comments = @image.comments.recent
  end

  def create
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = Image.new(image_params)

    if @image.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def edit
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = @gallery.images.find(params[:id])
  end

  def update
    @image = current_user.images.find(params[:id])

    if @image.update(image_params)
      redirect_to @image
    else
      render :edit
    end
  end

  private

  def image_params
    params.require(:image).permit(:url, group_ids: []).merge(gallery_id: params[:gallery_id])
  end
end
