export class Animations
{
  constructor(){}

  raffle(elem)
  {
    let time = 0.6 + Math.random();

    elem.style.animationDuraion = time + 's';
    elem.style.animationDelay = time + 's';
  }
}
