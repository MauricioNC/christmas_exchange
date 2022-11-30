class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    raise if !@group.save

    link = generate_link({model: 'group', token: @group.token})
    @group.update_attribute(:link, link)

    redirect_to root_path, success: "Group created successfully"
  rescue => e
    redirect_to root_path, error: "Error creating group, #{e.message}"
  end

  private

  def group_params
    params.require(:group).permit(:group_name)
  end
end
