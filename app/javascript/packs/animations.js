export class Animations
{
  constructor(){}

  raffle(elem)
  {
    let time = 0.6 + Math.random();

    elem.style.animationDuraion = time + 's';
    elem.style.animationDelay = time + 's';
  }

  snow(elem, snowflake_sizes = [])
  {
    let j = 0;
    let random_snowflake_size = 0;

    while(j <= 300)
    {
      let new_snowflake = document.createElement('div');

      random_snowflake_size =  this.random(3, 1);

      new_snowflake.classList.add('snow__snowflake');
      new_snowflake.classList.add(`snow__snowflake--${snowflake_sizes[Math.floor(random_snowflake_size)-1]}`);

      let x = this.random(10);
      let time = this.random(8, 3);

      new_snowflake.style.animationDuration = time + 's';
      new_snowflake.style.animationDelay = time + 's';
      new_snowflake.style.left = x + 'px';

      elem.appendChild(new_snowflake);

      j++;
    }
  }

  random(max = 0, min = 0)
  {
    return min > 0 ? (Math.random() * max) + min : (Math.random() * max);
  }
}
