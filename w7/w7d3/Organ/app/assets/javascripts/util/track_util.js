(function (root) {
  if (typeof root.TrackUtils === "undefined") root.TrackUtils = {};

  var _initTrack = function (track) {
    return new Track({
      name: track.name,
      created: track.created,
      roll: track.roll,
      id: track.id
    })
  };

  root.TrackUtils = {
    fetchAllTracks: function(callback) {
      $.ajax({
        url: "/api/tracks",
        method: "GET",
        success: function (tracks) {
          var newTracks = tracks.map(function (track) {
            return _initTrack(track);
          })
          callback(newTracks);
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
          callback(_initTrack(track));
        },
        error: function (e) {
          console.log(e);
        }
      })
    }
  }
})(this)