/* global React, Note, Key, Recorder */

(function(root) {
  'use strict';

  if (typeof root.Organ === "undefined") {
    root.Organ = {};
  }

  var Organ = root.Organ = React.createClass({
    render: function () {
      return (
        <div>
          <div className="keyboard">
          {
            Object.keys(window.TONES).map(function (tone, idx) {
              return <Key noteName={tone} key={idx}/>;
            })
          }
          </div>
          <div className="clearfix">
            <Recorder className="Recorder" />
          </div>
        </div>
      );
    }
  });
}(this));
