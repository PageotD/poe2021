

window.addEventListener('DOMContentLoaded', (event) => {
    //console.log('DOM fully loaded and parsed');
    const solutions = document.querySelectorAll('.solution');

    const handleClick = i => event => {
      //console.log(event.target, i);
      event.target.classList.toggle("solution-show");
    }
    for (let i = 0 ; i < solutions.length; i += 1) {
      solutions[i].addEventListener('click', handleClick(i));
    }
});
