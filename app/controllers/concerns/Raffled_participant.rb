module RaffledParticipant
  extend ActiveSupport::Concern

  # if the random number is valid, the renturns a participant with that id, otherwise will return nil
  def get_raffled_participant
    random_num = get_random()
    Participant.find(random_num)
  end

  # get a random number only if the participant with id of random is valid
  def get_random
    random = 0
    loop do
      random = Random.rand(1..Participant.count) if Participant.count > 1
      break if is_valid_participant(random)
    end
    random
  end

  def is_valid_participant(random)
    Participant.find(random).token != params[:token] && Participant.find(random).is_raffled == nil
  end
end
