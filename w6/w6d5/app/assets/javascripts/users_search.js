$.UsersSearch = function (el) {
  this.$el = $(el);
  this.$input = $('input.input-search');
  this.$ul = $('ul.users');
  this.bindEvent();
};

$.UsersSearch.prototype.render = function (resp) {
  var that = this;
  var html = "";
  resp.forEach(function(user) {
    html += "<li><a href='/users/" + user.id +
            "'>" + user.username  +
            "</a> </li> " +
            that.generateButton(user);

  });

  this.$ul.html(html);
  $("button.follow-toggle").followToggle();
};

$.UsersSearch.prototype.generateButton = function(user) {
  return ("<button " +
    "type='button' " +
    "data-user-id = '" + user.id + "' " +
    "data-initial-follow-state = '" + user.followed + "' " +
    "class = 'follow-toggle btn btn-default' " +
    "name='button'>" +
    "</button>");
};

$.UsersSearch.prototype.bindEvent = function () {
  var input = this.$input;
  var userSearch = this;
  this.$input.keyup(function() {
    $.ajax({
      url: "/users/search",
      type: "get",
      dataType: "json",
      data: "query="  + input.val(),
      success: function(resp) {
        console.log(resp);
        userSearch.render(resp);
      }
    });
  });



};

$.fn.usersSearch = function () {
  return this.each(function () {
    new $.UsersSearch(this);
  });
};

$(function () {
  $("div.users-search").usersSearch();
});
