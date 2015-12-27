(function (root) {
  if (typeof root.TrackUtil === "undefined") root.TrackUtil = {};

  root.TrackUtil = {
    fetchAllTracks: function() {
      $.ajax({
        url: "/api/tracks",
        method: "GET",
        success: function (tracks) {
          console.log(tracks);
        },
        error: function (e) {
          console.log(e);
        }
      })
    },
    saveTrack: function (track) {
      $.ajax({
        url: "/api/tracks",
        method: "POST",
        data: track,
        success: function (track) {
          console.log(track);
        },
        error: function (e) {
          console.log(e);
        }
      })
    }
  }
})(this)