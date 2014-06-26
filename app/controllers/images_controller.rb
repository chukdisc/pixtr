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
    @image = current_user.images.find(params[:id])
    @tag = Tag.new
    @tags = Tag.all
  end

  def update
    @image = current_user.images.find(params[:id])
    @tags = Tag.all
    @tag = Tag.new

    if @image.update(image_params)
      redirect_to [:edit, @image]
    else
      render :edit
    end
  end

  private

  def image_params
    params.require(:image).permit(:url, :tags, tag_ids: [], group_ids: [])
  end
end
