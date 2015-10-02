$.Thumbnails = function(el) {
  this.$el = $(el);
  this.$activeImage = $('.gutter img:first-child');
  this.gutterIdx = 0;
  this.$images = $(".gutter img");
  this.activate(this.$activeImage);
  this.bindEvent();
  this.fillGutterImages();
};

$.Thumbnails.prototype.activate = function($img) {
  var $bigImage = $img.clone();
  $('div.active').append($bigImage);
};

$.Thumbnails.prototype.bindEvent = function() {
  $('#left').on("click", this.click.bind(this, -1));
  $('#right').on("click", this.click.bind(this, 1));
  $(".gutter").on("mouseenter", "img", this.mouseEnter.bind(this) );
  // $(".gutter-images").on("mouseleave", "img", this.mouseLeaves.bind(this) );
};

$.Thumbnails.prototype.mouseEnter = function(e) {
  $('div.active img').remove();
  var $currentTarget = $(e.currentTarget);
  this.activate($currentTarget);
};

$.Thumbnails.prototype.mouseLeave = function(e) {
  this.$activeImage = $(e.currentTarget);
  this.activate(this.$activeImage);
};

$.Thumbnails.prototype.fillGutterImages = function() {
  var index;
  $(".gutter img").remove();
  for (var i = this.gutterIdx; i < this.gutterIdx + 5; i++) {
    index = this.wrapIndex(i);
    $(".gutter").append(this.$images[index]);
  }
};

$.Thumbnails.prototype.click = function(direction) {
  console.log(this.gutterIdx);
  this.gutterIdx = this.wrapIndex(this.gutterIdx + direction);
  this.fillGutterImages();
};

$.Thumbnails.prototype.wrapIndex = function(index) {
  var idx = Math.abs(index % this.$images.length);
  if (idx < 0) {
    idx = 15 - idx;
  }
  return idx;
};

$.fn.thumbnails = function() {
  return this.each(function() {
    new $.Thumbnails(this);
  });
};
