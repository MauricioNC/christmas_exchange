class ParticipantsController < ApplicationController
  before_action :set_group, only: [:create]

  def show
  end

  def new
    @participant = Participant.new
  end
  def create
    @participant = @group.participants.build(participant_params)

    if @participant.save
      link = generate_link({model: 'participant', participant_name: @participant.name, token: @participant.token})

      @participant.update_attribute(:participant_link, link)
      flash[:success] = ["You registered successfully to: #{@group.group_name}"]
      flash[:success] << "Please go to this #{link} link to see what participant you'll give a gift!!"

      redirect_to "/group/#{@group.group_name}/#{@group.token}"
    else
      redirect_to "/group/#{@group.group_name}/#{@group.token}", error: @participant.errors[:name][0]
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :description)
  end

  def set_group
    @group = Group.find_by(token: params[:participant][:group_token])
  end
end
