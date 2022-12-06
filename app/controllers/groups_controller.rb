class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      link = generate_link({model: 'group', group_name: @group.group_name, token: @group.token})

      @group.update_attribute(:link, link)

      flash[:success] =  "Group #{@group.group_name}created successfully"
      flash[:success]<< "Share this #{link} link with your friends that will be part of the exchange!!"

      render :new
    else
      redirect_to root_path, error: "Error creating group"
    end
  end

  private

  def group_params
    params.require(:group).permit(:group_name)
  end
end
