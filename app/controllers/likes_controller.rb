class LikesController < ApplicationController
  def create
    image = Image.find(params[:image_id])
    current_user.like image

    redirect_to image
  end

  def destroy
    image = Image.find(params[:image_id])
    current_user.liked_images.destroy(image)
    redirect_to image
  end

end
