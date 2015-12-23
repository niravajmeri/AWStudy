function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10)
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}

function CountDownTimer(dt, id)
    {
        var end = new Date(dt);

        var _second = 1000;
        var _minute = _second * 60;
        var _hour = _minute * 60;
        var _day = _hour * 24;
        var timer;

        function showRemaining() {
            var now = new Date();
            var distance = end - now;
            if (distance < 0) {

                clearInterval(timer);
                document.getElementById(id).innerHTML = 'Bonus opportunity expired. You can still complete the task for regular payment.';

                return;
            }
            //With Days
            //var days = Math.floor(distance / _day); // Uncomment to include days
            //var hours = Math.floor((distance % _day) / _hour); // Uncomment to include days
            
            // In hours minutes seconds
            //var hours = Math.floor(distance / _hour); // Comment this line if you are including days
            var minutes = Math.floor(distance / _minute);
            var seconds = Math.floor((distance % _minute) / _second);

            //document.getElementById(id).innerHTML = days + 'days '; // Uncomment to include days
            //document.getElementById(id).innerHTML += hours + 'hrs ';
            //document.getElementById(id).innerHTML = hours + 'hrs ';
            document.getElementById(id).innerHTML = 'Bonus opportunity expires in '
            document.getElementById(id).innerHTML += minutes + 'mins ';
            document.getElementById(id).innerHTML += seconds + 'secs!';
        }

        timer = setInterval(showRemaining, 1000);
    }

window.onload = function () {
    var starttime = document.getElementById("bonusstarttime");
    //alert(starttime.value);
    var duration = document.getElementById("bonusduration").value;
	//alert(duration);
    var endtime = new Date(starttime.value);
    endtime = new Date(endtime.getTime() + duration*60000);
    //alert(endtime);
    //var fiveMinutes = 60 * 5, display = document.querySelector('#time');
    //startTimer(fiveMinutes, display);
    CountDownTimer(endtime,'countdown');
};

