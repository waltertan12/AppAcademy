function Clock () {
  this.currentTime = new Date();
  // this.seconds = this.currentTime.getSeconds();
  // this.minutes = this.currentTime.getMinutes();
  // this.hours = this.currentTime.getHours();
}

Clock.TICK = 1000;

Clock.prototype.printTime = function () {
  // Format the time in HH:MM:SS
  var formmatedTime = this.hours + ":" + this.minutes + ":" + this.seconds;
  console.log(formmatedTime);
};

Clock.prototype.run = function () {
  // 1. Set the currentTime.
  // 2. Call printTime.
  // 3. Schedule the tick interval.

  var that = this;
  setInterval(function (){
    that._tick();
    that.printTime();
  },Clock.TICK);
};

Clock.prototype._tick = function () {
  // 1. Increment the currentTime.
  // 2. Call printTime.
  var now = this.currentTime.getTime();
  this.currentTime.setTime(now + Clock.TICK);
  this.seconds = this.currentTime.getSeconds();
  this.minutes = this.currentTime.getMinutes();
  this.hours = this.currentTime.getHours();
};

var clock = new Clock();
clock.run();
