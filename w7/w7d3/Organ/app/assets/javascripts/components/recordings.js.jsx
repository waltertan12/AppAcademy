(function (root) {
  'use strict';
  if (typeof root.Recordings === "undefined") {
    root.Recordings = {};
  }

  root.Recordings = React.createClass({
    getInitialState: function () {
      return ({
        tracks: []
      });
    },

    componentDidMount: function () {
      TrackStore.addChangeListener(this.updateTracks);
      root.TrackActions.getTracks();
    },

    updateTracks: function () {
      this.setState({tracks: TrackStore.all()});
    },

    render: function () {
      var tracks = this.state.tracks;

      return (
        <div className="recordings">
          <h3>Recordings</h3>
          <hr/>
          <ul>
            {
              tracks.map(function (track) {
                return <li key={track.id}>{track.name}</li>;
              })
            }
          </ul>
        </div>
      );
    }
  });
})(this);