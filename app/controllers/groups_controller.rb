class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      link = generate_link({model: 'group', group_name: @group.group_name, token: @group.token})

      @group.update_attribute(:link, link)

      flash[:success] =  ["Group #{@group.group_name}created successfully"]
      flash[:success]<< "Share this http://localhost:3000#{link} link with your friends that will be part of the exchange!!"

      redirect_to new_group_path
    else
      redirect_to new_group_path, error: @group.errors[:group_name][0]
    end
  end

  private

  def group_params
    params.require(:group).permit(:group_name)
  end
end
