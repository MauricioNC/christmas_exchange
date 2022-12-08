export class Animations
{
  constructor(){}

  raffle(elem)
  {
    let left = 10 + Math.random();
    let right = 10 + Math.random();
    let top = 10 + Math.random();
    let bottom = 10 + Math.random();
    let time = 0.6 + Math.random();

    elem.style.animationDuraion = time + 's';
    elem.style.animationDelay = time + 's';
    elem.style.left = left + 'px';
    elem.style.right = right + 'px';
    elem.style.top = top + 'px';
    elem.style.bottom = bottom + 'px';
  }
}
