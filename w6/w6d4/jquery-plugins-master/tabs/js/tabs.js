
$.Tabs = function(el) {
  this.$el = $(el);
  this.$contentTabs = $(this.$el.data());
  this.$activeTab = $("article.active");
  console.log(this.$activeTab);
  this.bindEvent();
};

$.Tabs.prototype.bindEvent = function() {
  $("a").on("click", this.clickTab.bind(this));
};

$.Tabs.prototype.clickTab = function(e) {
  e.preventDefault();

  $('.tabs .active').removeClass("active");

  var $currentTarget = $(e.currentTarget);
  $currentTarget.addClass("active");

  this.$activeTab.addClass("transitioning");
  this.transition($currentTarget);
};

$.Tabs.prototype.transition = function($currentTarget) {
  this.$activeTab.one("transitionend", function() {

    this.$activeTab.removeClass("transitioning")
                   .removeClass("active");
    this.$activeTab = $($currentTarget.attr("href"));
    this.$activeTab.addClass("transitioning")
                   .addClass("active");

    setTimeout(function() {
      this.$activeTab.removeClass("transitioning");
    }.bind(this), 0);
  }.bind(this));
};

$.fn.tabs = function() {
  return this.each(function(){
    new $.Tabs(this);
  });
};
