<script 
    src="https://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js" 
    integrity="sha384-Fe7o4IB+X/R42l4ubeFS03yRfSAAB99jbFAEQS6OSH1Sx+vKlefJt3gHPd/H6CO3" 
    crossorigin="anonymous">    
</script>
<script>

$(document).ready(()=> {
    
    // Create Countdown
    var Countdown = {
        // Backbone-like structure
        $el: $('.countdown'),
        
        // Params
        fromDate: new Date('{{$timerDate}}'),
        hoursDuration: Number('{{$timerHours}}'),
        countdown_interval: null,
        total_seconds     : 0,

        // kalkulasi tanggal countdown
        calculateRemaining: function() {
            let targetDate = new Date(this.fromDate);
            targetDate.setHours(targetDate.getHours() + this.hoursDuration);

            // Get the current time in UTC
            let now = new Date();

            // Calculate the difference in milliseconds
            let diff = targetDate - now;

            // Initialize remaining time components
            let remainingHours = 0;
            let remainingMinutes = 0;
            let remainingSeconds = 0;

            // If the time difference is positive, calculate hours, minutes, and seconds
            if (diff > 0) {
                let totalSeconds = Math.floor(diff / 1000); // Total seconds remaining
                remainingHours = Math.floor(totalSeconds / 3600); // Calculate hours
                let remainingAfterHours = totalSeconds % 3600; // Remaining seconds after hours
                remainingMinutes = Math.floor(remainingAfterHours / 60); // Calculate minutes
                remainingSeconds = remainingAfterHours % 60; // Remaining seconds
            }
            return {
                hours: remainingHours,
                minutes: remainingMinutes,
                seconds: remainingSeconds
            };
        },
        
        // Initialize the countdown  
        init: function() {
            
            // DOM
            this.$ = {
                hours  : this.$el.find('.bloc-time.hours .figure'),
                minutes: this.$el.find('.bloc-time.min .figure'),
                seconds: this.$el.find('.bloc-time.sec .figure')
            };

            // Init countdown values
            let remainings = this.calculateRemaining();
            this.values = {
                hours  : remainings.hours,
                minutes: remainings.minutes,
                seconds: remainings.seconds,
            };
            
            // Initialize total seconds
            this.total_seconds = this.values.hours * 60 * 60 + (this.values.minutes * 60) + this.values.seconds;

            // Animate countdown to the end 
            this.count();    
        },
        
        count: function() {
            
            var that    = this,
                $hour_1 = this.$.hours.eq(0),
                $hour_2 = this.$.hours.eq(1),
                $min_1  = this.$.minutes.eq(0),
                $min_2  = this.$.minutes.eq(1),
                $sec_1  = this.$.seconds.eq(0),
                $sec_2  = this.$.seconds.eq(1);
            
                this.countdown_interval = setInterval(function() {

                if(that.total_seconds > 0) {

                    --that.values.seconds;              

                    if(that.values.minutes >= 0 && that.values.seconds < 0) {

                        that.values.seconds = 59;
                        --that.values.minutes;
                    }

                    if(that.values.hours >= 0 && that.values.minutes < 0) {

                        that.values.minutes = 59;
                        --that.values.hours;
                    }

                    // Update DOM values
                    // Hours
                    that.checkHour(that.values.hours, $hour_1, $hour_2);

                    // Minutes
                    that.checkHour(that.values.minutes, $min_1, $min_2);

                    // Seconds
                    that.checkHour(that.values.seconds, $sec_1, $sec_2);

                    --that.total_seconds;
                }
                else {
                    clearInterval(that.countdown_interval);
                }
            }, 1000);    
        },
        
        animateFigure: function($el, value) {
            
            var that         = this,
                $top         = $el.find('.top'),
                $bottom      = $el.find('.bottom'),
                $back_top    = $el.find('.top-back'),
                $back_bottom = $el.find('.bottom-back');

            // Before we begin, change the back value
            $back_top.find('span').html(value);

            // Also change the back bottom value
            $back_bottom.find('span').html(value);

            // Then animate
            TweenMax.to($top, 0.8, {
                rotationX           : '-180deg',
                transformPerspective: 300,
                ease                : Quart.easeOut,
                onComplete          : function() {

                    $top.html(value);

                    $bottom.html(value);

                    TweenMax.set($top, { rotationX: 0 });
                }
            });

            TweenMax.to($back_top, 0.8, { 
                rotationX           : 0,
                transformPerspective: 300,
                ease                : Quart.easeOut, 
                clearProps          : 'all' 
            });    
        },
        
        checkHour: function(value, $el_1, $el_2) {
            
            var val_1       = value.toString().charAt(0),
                val_2       = value.toString().charAt(1),
                fig_1_value = $el_1.find('.top').html(),
                fig_2_value = $el_2.find('.top').html();

            if(value >= 10) {

                // Animate only if the figure has changed
                if(fig_1_value !== val_1) this.animateFigure($el_1, val_1);
                if(fig_2_value !== val_2) this.animateFigure($el_2, val_2);
            }
            else {

                // If we are under 10, replace first figure with 0
                if(fig_1_value !== '0') this.animateFigure($el_1, 0);
                if(fig_2_value !== val_1) this.animateFigure($el_2, val_1);
            }    
        }
    };
    // yoooooo lagi santai kawan
    Countdown.init();
});
</script>
<style>
    body {
        background-color: #f2f1ed;
    }

    .wrap {
        position: absolute;
        bottom: 0;
        top: 0;
        left: 0;
        right: 0;
        margin: auto;
        height: 310px;
    }

    a {
        text-decoration: none;
        color: #1a1a1a;
    }

    h1 {
        margin-bottom: 60px;
        text-align: center;
        font: 300 2.25em "Lato";
        text-transform: uppercase;
    }

    h1 strong {
        font-weight: 400;
        color: #ea4c4c;
    }

    h2 {
        margin-bottom: 80px;
        text-align: center;
        font: 300 0.7em "Lato";
        text-transform: uppercase;
    }

    h2 strong {
        font-weight: 400;
    }

    .countdown {
        width: 720px;
    }

    .countdown .bloc-time {
        float: left;
        margin-right: 45px;
        text-align: center;
    }

    .countdown .bloc-time:last-child {
        margin-right: 0;
    }

    .countdown .count-title {
        display: block;
        margin-bottom: 15px;
        font: normal 0.94em "Lato";
        color: #1a1a1a;
        text-transform: uppercase;
    }

    .countdown .figure {
        position: relative;
        float: left;
        height: 55px;
        width: 45px;
        margin-right: 10px;
        background-color: #fff;
        border-radius: 8px;
        -moz-box-shadow: 0 3px 4px 0 rgba(0, 0, 0, 0.2), inset 2px 4px 0 0 rgba(255, 255, 255, 0.08);
        -webkit-box-shadow: 0 3px 4px 0 rgba(0, 0, 0, 0.2), inset 2px 4px 0 0 rgba(255, 255, 255, 0.08);
        box-shadow: 0 3px 4px 0 rgba(0, 0, 0, 0.2), inset 2px 4px 0 0 rgba(255, 255, 255, 0.08);
    }

    .countdown .figure:last-child {
        margin-right: 0;
    }

    .countdown .figure>span {
        position: absolute;
        left: 0;
        right: 0;
        margin: auto;
        font: normal 2.5em/55px "Lato";
        font-weight: 700;
        color: #de4848;
    }

    .countdown .figure .top:after,
    .countdown .figure .bottom-back:after {
        content: "";
        position: absolute;
        z-index: -1;
        left: 0;
        bottom: 0;
        width: 100%;
        height: 100%;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    }

    .countdown .figure .top {
        z-index: 3;
        background-color: #f7f7f7;
        transform-origin: 50% 100%;
        -webkit-transform-origin: 50% 100%;
        -moz-border-radius-topleft: 10px;
        -webkit-border-top-left-radius: 10px;
        border-top-left-radius: 10px;
        -moz-border-radius-topright: 10px;
        -webkit-border-top-right-radius: 10px;
        border-top-right-radius: 10px;
        -moz-transform: perspective(200px);
        -ms-transform: perspective(200px);
        -webkit-transform: perspective(200px);
        transform: perspective(200px);
    }

    .countdown .figure .bottom {
        z-index: 1;
    }

    .countdown .figure .bottom:before {
        content: "";
        position: absolute;
        display: block;
        top: 0;
        left: 0;
        width: 100%;
        height: 50%;
        background-color: rgba(0, 0, 0, 0.02);
    }

    .countdown .figure .bottom-back {
        z-index: 2;
        top: 0;
        height: 50%;
        overflow: hidden;
        background-color: #f7f7f7;
        -moz-border-radius-topleft: 10px;
        -webkit-border-top-left-radius: 10px;
        border-top-left-radius: 10px;
        -moz-border-radius-topright: 10px;
        -webkit-border-top-right-radius: 10px;
        border-top-right-radius: 10px;
    }

    .countdown .figure .bottom-back span {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        margin: auto;
    }

    .countdown .figure .top,
    .countdown .figure .top-back {
        height: 50%;
        overflow: hidden;
        -moz-backface-visibility: hidden;
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
    }

    .countdown .figure .top-back {
        z-index: 4;
        bottom: 0;
        background-color: #fff;
        -webkit-transform-origin: 50% 0;
        transform-origin: 50% 0;
        -moz-transform: perspective(200px) rotateX(180deg);
        -ms-transform: perspective(200px) rotateX(180deg);
        -webkit-transform: perspective(200px) rotateX(180deg);
        transform: perspective(200px) rotateX(180deg);
        -moz-border-radius-bottomleft: 10px;
        -webkit-border-bottom-left-radius: 10px;
        border-bottom-left-radius: 10px;
        -moz-border-radius-bottomright: 10px;
        -webkit-border-bottom-right-radius: 10px;
        border-bottom-right-radius: 10px;
    }

    .countdown .figure .top-back span {
        position: absolute;
        top: -100%;
        left: 0;
        right: 0;
        margin: auto;
    }
</style>
<div class="d-flex p-4">
    <div class="countdown mx-2">
        <div class="bloc-time hours">
            <span class="count-title">Hours</span>

            <div class="figure hours hours-1">
                <span class="top">0</span>
                <span class="top-back">
                    <span>2</span>
                </span>
                <span class="bottom">0</span>
                <span class="bottom-back">
                    <span>2</span>
                </span>
            </div>

            <div class="figure hours hours-2">
                <span class="top">0</span>
                <span class="top-back">
                    <span>4</span>
                </span>
                <span class="bottom">0</span>
                <span class="bottom-back">
                    <span>4</span>
                </span>
            </div>
        </div>

        <div class="bloc-time min">
            <span class="count-title">Minutes</span>

            <div class="figure min min-1">
                <span class="top">0</span>
                <span class="top-back">
                    <span>0</span>
                </span>
                <span class="bottom">0</span>
                <span class="bottom-back">
                    <span>0</span>
                </span>
            </div>

            <div class="figure min min-2">
                <span class="top">0</span>
                <span class="top-back">
                    <span>0</span>
                </span>
                <span class="bottom">0</span>
                <span class="bottom-back">
                    <span>0</span>
                </span>
            </div>
        </div>

        <div class="bloc-time sec">
            <span class="count-title">Seconds</span>

            <div class="figure sec sec-1">
                <span class="top">0</span>
                <span class="top-back">
                    <span>0</span>
                </span>
                <span class="bottom">0</span>
                <span class="bottom-back">
                    <span>0</span>
                </span>
            </div>

            <div class="figure sec sec-2">
                <span class="top">0</span>
                <span class="top-back">
                    <span>0</span>
                </span>
                <span class="bottom">0</span>
                <span class="bottom-back">
                    <span>0</span>
                </span>
            </div>
        </div>
    </div>
</div>