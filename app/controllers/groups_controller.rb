class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    group = Group.create(group_params)
    redirect_to :groups
  end

  def index
    @groups = Group.all
  end

  private

  def group_params
    params.require(:group).permit(
      :name,
      :description
    )
  end
end
