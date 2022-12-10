import { Animations } from "./animations";

setTimeout(() => {
  if (typeof random_participant_data !== 'undefined')
  {
    /*
      Add a validation to validate if the typeof participants variable that is created in the index.html.erb file form the exchange controller is 'undefined', if not, then execute the animation at first time, if the typeof is equal to 'undefined', that means that the user already saw the participant the he/she/ must give a gift.
    */
    if (typeof participants != 'undefined')
    {
      participants = JSON.parse(participants);
      print_participants(participants)

      setTimeout(() => {
        print_gift_to_participant()
      }, 10000);
    }
    else
    {
      print_gift_to_participant()
    }


  }
}, 100);

function print_participants(participants)
{
  const participants_container = document.getElementById('participants')

  participants.forEach(p => {
    const participant = document.createElement('div')
    let raffle_participant_animation = new Animations();

    participant.className = `${p.name}`;
    participant.id = `${p.name}`;
    participant.textContent = p.name;

    raffle_participant_animation.raffle(participant);
    participants_container.appendChild(participant);

  });
}

function print_gift_to_participant()
{
  document.getElementById('participants').style.opacity = '0';

  // Wait 1s after the participants element is fully hide, then set the display none property
  setTimeout(() => {
    document.getElementById('participants').style.display = 'none';
  }, 1000);

  if (gift_to_participant)
  {
    // participant = JSON.parse(participant);

    // Wait 1s after the participants element is fully hide
    setTimeout(() => {
      gift_to_participant.textContent = participant;
      gift_to_participant.style.opacity = '1';
    }, 1800);
  }
}
