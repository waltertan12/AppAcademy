(function (root) {
  if (typeof root.TrackUtils === "undefined") root.TrackUtils = {};

  root.TrackUtils = {
    fetchAllTracks: function(callback) {
      $.ajax({
        url: "/api/tracks",
        method: "GET",
        success: function (tracks) {
          callback(tracks);
        },
        error: function (e) {
          console.log(e);
        }
      })
    },
    saveTrack: function (track, callback) {
      $.ajax({
        url: "/api/tracks",
        method: "POST",
        data: {track: track},
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