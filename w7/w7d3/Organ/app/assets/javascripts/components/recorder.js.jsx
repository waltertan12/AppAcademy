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
        TrackActions.storeCurrentTrack(this.state.track);
      } else {
        this.setState({isRecording: true});
        this.state.track.startRecording();
      }
    },

    saveTrack: function (e) {
      console.log(this.state.track);
      e.preventDefault();
      var modal = document.getElementById("modal");
      modal.classList.add("active");
    },

    render: function() {
      var buttonClass, status;
      if (this.state.isRecording){
        buttonClass = "btn btn-danger";
        status = "Stop";
      }
      else{
        buttonClass = "btn btn-success";
        status = "Record";
      }

      return (
        <div>
          <button className={buttonClass} 
                  onClick={this.invokeAction}>{status}</button>
          <button className="btn btn-primary" 
                  onClick={this.state.track.play.bind(this.state.track)}>Play</button>
          <button className="btn btn-warning" onClick={this.saveTrack}>
            Save
          </button>
        </div>
      );
    }
  });

}(this));
