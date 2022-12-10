import { Animations } from "./animations";

setTimeout(() => {
  const snow_container = document.getElementById('snow');

  let snow_animation = new Animations();
  snow_animation.snow(snow_container, ['small', 'med', 'big']);
}, 100);
