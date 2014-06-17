class ImagesController < ApplicationController
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.find(params[:id])
  end

  def update
    gallery = Gallery.find(params[:gallery_id])
    image = gallery.images.find(params[:id])
    image.update(image_params)

    redirect_to gallery
  end

  def create
    image = Image.create(image_params)
    gallery = Gallery.find(params[:gallery_id])

    redirect_to "/galleries/#{gallery.id}"
  end

  private

  def image_params
    params.
      require(:image).
      permit(:url).merge(gallery_id: params[:gallery_id])
  end
end
