class GroupMembershipsController < ApplicationController
def create
  group_membership = GroupMembership.create(group_id: params[:group_id], user_id: current_user.id)
  redirect_to :groups
end

def destroy
  group = current_user.group_memberships.find_by(group_id: params[:group_id])
  group.destroy
  redirect_to :groups
end
end
