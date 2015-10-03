$.FollowToggle = function (el) {
  this.$el = $(el);
  this.userId = this.$el.data("user-id");
  this.followState = this.$el.data("initial-follow-state");
  this.render();
  this.handleClick();
};

$.FollowToggle.prototype.render = function () {
  if (this.followState) {
    this.$el.text("Unfollow!");
  } else {
    this.$el.text("Follow!");
  }
};

$.FollowToggle.prototype.handleClick = function () {
  var button = this;
  this.$el.on("click", function(event) {
    event.preventDefault();
    if (button.followState === false ) {
      $.ajax({
        url: "/users/" + button.userId + "/follow",
        type: "post",
        dataType: "json",
        success: function(resp) {
          console.log(resp);
          button.followState = true;
          button.render();
        }
      });
    } else {
      $.ajax({
        url: "/users/" + button.userId + "/follow",
        type: "delete",
        dataType: "json",
        success: function(resp) {
          console.log(resp);
          button.followState = false;
          button.render();
        }
      });
    }
  });
};

$.fn.followToggle = function () {
  return this.each(function () {
    new $.FollowToggle(this);
  });
};

$(function () {
  $("button.follow-toggle").followToggle();
});
