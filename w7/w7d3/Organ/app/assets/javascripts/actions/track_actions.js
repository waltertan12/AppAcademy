(function(root) {
  'use strict';

  root.TrackActions = {
    setCurrentTrack: function (track) {
      AppDispatcher.dispatch({
        actionType: "SET_TRACK",
        track: track
      });
    },
    getTracks: function (tracks) {
      var dispatchCallback = (tracks) => { 
        AppDispatcher.dispatch({
          actionType: "FETCH_TRACKS",
          tracks: tracks
        }) 
      };

      TrackUtils.fetchAllTracks(dispatchCallback);
    },
    saveTrack: function (track) {
      var dispatchCallback = (track) => { 
        AppDispatcher.dispatch({
          actionType: "SAVE_TRACK",
          track: track
        }) 
      };

      TrackUtils.saveTrack(track, dispatchCallback);
    },
    storeCurrentTrack: function (track) {
      AppDispatcher.dispatch({
        actionType: "STORE_TRACK",
        track: track
      })
    }
  };
})(this);