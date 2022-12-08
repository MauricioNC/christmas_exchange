import { Animations } from "./animations";

setTimeout(() => {
  const random_participant_data = document.getElementById('random_participant')

  if (random_participant_data)
  {
    participants = JSON.parse(participants);

    print_participants(participants)

    setTimeout(() => {
      print_gift_to_participant()

    }, 10000);
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
    console.log(participant);
    setTimeout(() => {
      gift_to_participant.textContent = participant;
      gift_to_participant.style.opacity = '1';
    }, 1800);
  }
}
