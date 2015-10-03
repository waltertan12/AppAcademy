$.TweetCompose = function (el) {
  this.$el = $(el);
  this.submit();
  this.checkChar();
};

$.TweetCompose.prototype.render = function () {

};

$.TweetCompose.prototype.submit = function () {
  var that = this;

  $('form.tweet-compose').on("submit", function(event) {
    event.preventDefault();
    var serializedData = $(".tweet-compose").serializeJSON();
    $("input").prop("disabled", true);

    $.ajax({
      url: "/tweets",
      type: "post",
      dataType: "json",
      data: serializedData,
      success: function(resp) {
        console.log(resp);
        that.handleSuccess(resp);
      }
    });
  });
};

$.TweetCompose.prototype.checkChar = function() {
  var $textarea = $("form textarea");
  $textarea.on("input", function() {
    var textValue = 140 - $textarea.val().length;

    if ((140 - $textarea.val().length) < 0)  {

      $(".charsleft").addClass("red");
      alert("Youre typing way too much.");
      var length = textValue;
      textValue = "ST";
      for (var i = 0; i < Math.abs(length); i++) {
        textValue += "A";
      }
      textValue += "HP!";
    } else {
      $(".charsleft").removeClass("red");
    }
    $(".charsleft").text(textValue);
  });
};

$.TweetCompose.prototype.clearInput = function(){
  $("form textarea").val("");
  $("form select").val("");
};

$.TweetCompose.prototype.handleSuccess = function(resp) {
  var THIS = this;
  THIS.$el.filter(":input").prop("disabled", false);
  THIS.clearInput();
  $("#feed").prepend("<li>" + JSON.stringify(resp) + "</li>");
};

$.fn.tweetCompose = function () {
  return this.each(function () {
    new $.TweetCompose(this);
  });
};

$(function () {
  $("form.tweet-compose").tweetCompose();
});
