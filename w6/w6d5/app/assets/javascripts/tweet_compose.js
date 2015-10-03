$.TweetCompose = function (el) {
  this.$el = $(el);
  this.submit();
  this.checkChar();
  this.addMention();
};

$.TweetCompose.prototype.addMention = function () {
  var $link = $("a.add-mentioned-user");
  var $mentioned = $("div.mentioned-users");
  var $scriptTag = $("script.mention");
  var html;
  var mention;
  $link.on("click", function(event) {
    event.preventDefault();
    console.log($scriptTag);
    html =  "<div>\n" + 
            $scriptTag.html() +
            "<a class=\"remove-mention\"" + 
            "href=\"javascript:void(0)\">Remove Mention</a>\n" +
            "</div>"
    console.log(html)
    $mentioned.append(html);
  });

  $mentioned.on("click","a.remove-mention", function(event) {
    event.preventDefault();
    console.log($(event.currentTarget).parent("div").empty());//.remove();
  });
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
  $("select.mentioned-users").val("");
};

$.TweetCompose.prototype.handleSuccess = function(resp) {
  var THIS = this;
  $("input").prop("disabled", false);
  THIS.clearInput();

  $("#feed").prepend("<li>" + 
                     resp.content + 
                     " -- " +
                     "<a href=\"/users/" + 
                     resp.user_id +
                     "\">" +
                     resp.user.username + 
                     "</a>" + 
                     " -- " +
                     resp.created_at +
                     "</li>");
};

$.fn.tweetCompose = function () {
  return this.each(function () {
    new $.TweetCompose(this);
  });
};

$(function () {
  $("form.tweet-compose").tweetCompose();
});
