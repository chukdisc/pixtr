class TagsController < ApplicationController
  def create
    @image = current_user.images.find(params[:image_id])
    if Tag.create(tag_params)
      redirect_to [:edit, @image]
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :tag_id)
  end
end
