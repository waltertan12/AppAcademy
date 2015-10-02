$.Carousel = function (el) {
  this.$el = $(el);
  this.activeIdx = 0;
  this.assignIDs();
  $("ul li:first-child").addClass("active");
  this.bindEvent();
};

$.Carousel.prototype.bindEvent = function() {
  $(".slide-right").on("click", this.slide.bind(this, 1));
  $(".slide-left").on("click", this.slide.bind(this, -1));
};

$.Carousel.prototype.slide = function(dir) {
  var $currentCorgi = $("#"+ this.activeIdx);
  var length = $("ul").children().length;
  var nextId = this.activeIdx + dir;
  var dirClass;
  var otherDir;
  if(dir === -1) {
    dirClass = "left";
    otherDir = "right";
  } else {
    dirClass = "right";
    otherDir = "left";
  }
  if (nextId < length && nextId >= 0) {
    this.activeIdx = nextId;
  } else if( length === nextId ){
    this.activeIdx = 0;
  } else if( nextId === -1){
    this.activeIdx = length - 1;
  }

  var $nextCorgi = $('#' + this.activeIdx);
  $nextCorgi.addClass("active " + dirClass);
  setTimeout(function(){
    $currentCorgi.addClass(otherDir);
    $nextCorgi.removeClass(dirClass);
    $currentCorgi.one("transitionend", function(){
      $currentCorgi.removeClass("active " + otherDir);
    });
  }, 0);
};



$.Carousel.prototype.assignIDs = function() {
  var $ulChildren = $('ul').children();
  $ulChildren.each(function(index, elem) {
    $(elem).attr("id", index);
  });
};

$.fn.carousel = function() {
  return this.each(function(){
    new $.Carousel(this);
  });
};
