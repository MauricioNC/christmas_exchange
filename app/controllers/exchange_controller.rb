class ExchangeController < ApplicationController
  before_action :validate_gift_to_assoc, :set_current_user, :validate_participants_raffled

  def index
    @participants = Participant.select(:name)

    if @random_participant.nil?
      @random_participant = get_raffled_participant()

      if @random_participant
        lock_participant(@random_participant.id)
        addParticipantToGiveAGive(@random_participant.id)
      else
        flash[:error] = "Something went wrong, please reload the page."
      end
    else
      @random_participant
    end
  end

  private

  def lock_participant(participant)
    Participant.find(participant).update_attribute(:is_raffled, true)
  end

  def addParticipantToGiveAGive(participant_to_give_gift)
    Participant.find_by(token: params[:token]).update_attribute(:gift_to, participant_to_give_gift)
  end

  def validate_gift_to_assoc
    @random_participant = Participant.find(Participant.find_by(token: params[:token]).gift_to) if Participant.where.not(gift_to: nil).find_by(token: params[:token])
  end

  def set_current_user
    @current_user = Participant.find_by(token: params[:token])
  end

  def validate_participants_raffled
    total_participants_of_current_group = Participant.where(group_id: @current_user.group_id).count
    participants_raffled = Participant.where.not(id: @current_user.id).where(is_raffled: nil).count
    participant_not_gift_to = Participant.find_by(id: @current_user.id).gift_to.nil?

    if participant_not_gift_to && participants_raffled === 0
      @random_participant = "There are no more participants to raffle, just you, wait until other participants registered to raffle. The number of participant for #{Group.find(@current_user.group_id).group_name} group is #{Participant.where(group_id: @current_user.group_id).count}"
    end
  end
end
