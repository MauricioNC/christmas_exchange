class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      link = generate_link({model: 'group', group_name: @group.group_name, token: @group.token})
      pp link
      @group.update_attribute(:link, link)

      redirect_to root_path, success: "Group created successfully"
    else
      redirect_to root_path, error: "Error creating group"
    end
  end

  private

  def group_params
    params.require(:group).permit(:group_name)
  end
end
