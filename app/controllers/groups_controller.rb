class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, success: "Group created successfully"
    else
      redirect_to root_path, error: "Error creating group"
    end
  end

  private

  def group_params
    params.permit(:group_name)
  end
end
