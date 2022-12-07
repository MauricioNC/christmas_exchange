class ExchangeController < ApplicationController
  before_action :validate_gift_to_assoc

  def index
    @participants = Participant.select("name")

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

  def lock_participant(participant)
    Participant.find(participant).update_attribute(:is_raffled, true)
  end

  def addParticipantToGiveAGive(participant_to_give_gift)
    Participant.find_by(token: params[:token]).update_attribute(:gift_to, participant_to_give_gift)
  end

  def validate_gift_to_assoc
    @random_participant = Participant.find(Participant.find_by(token: params[:token]).gift_to) if Participant.where.not(gift_to: nil).find_by(token: params[:token])
  end
end
