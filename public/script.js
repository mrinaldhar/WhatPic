
  var x = <%= @difficulty %>;
alert(x);
      var element = document.getElementById('timedet');
  function timer() {
    if (x<=0)
    {

      window.clearInterval(time);
      window.location ='/play';
    }

    element.innerHTML = x.toFixed(2)+' seconds'
    if (x<=10)
    {
      element.style.color="red";
    }
    x=x-0.01;

  }
  var time;
  time = window.setInterval(timer, 10);