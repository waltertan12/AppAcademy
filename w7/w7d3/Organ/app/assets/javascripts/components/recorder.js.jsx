/* global React, Track, KeyStore */

(function(root) {
  'use strict';

  if (typeof root.Recorder === "undefined") {
    root.Recorder = {};
  }

  root.Recorder = React.createClass({
    getInitialState: function() {
      return {
        isRecording: false,
        track: new Track({name: "", roll: []})
      };
    },

    componentDidMount: function() {
      KeyStore.addChangeHandler("CHANGE", this.recordNote);
    },

    recordNote: function () {
      if (this.state.isRecording) {
        var currentTrack = this.state.track;
        currentTrack.addNotes( KeyStore.all().slice() );
      }
    },

    invokeAction: function () {
      if (this.state.isRecording) {
        this.setState({isRecording: false});
        this.state.track.stopRecording();
      } else {
        this.setState({isRecording: true});
        this.state.track.startRecording();
      }
    },

    status: function () {
      var state;

      if (this.state.isRecording)
        state = "Stop";
      else
        state = "Record";

      return state;
    },

    render: function() {
      var buttonClass;
      if (this.state.isRecording)
        buttonClass = "btn btn-danger";
      else
        buttonClass = "btn btn-success";
      return (
        <div>
          <button className={buttonClass} 
                  onClick={this.invokeAction}>{this.status()}</button>
          <button className="btn btn-primary" 
                  onClick={this.state.track.play.bind(this.state.track)}>Play</button>
          <button className="btn btn-warning">Save</button>
        </div>
      );
    }
  });

}(this));
