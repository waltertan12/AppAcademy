/* global React, Note, Key, Recorder */

(function(root) {
  'use strict';

  if (typeof root.Organ === "undefined") {
    root.Organ = {};
  }

  var Organ = root.Organ = React.createClass({
    composerGenerator: function () {
      var composers = [
        "Beethoven",
        "Mozart",
        "Chopin",
        "Shostakovich",
        "Stravinsky",
        "Liszt",
        "Debussy",
        "Ravel",
        "Bach",
        "Rick Astley"
      ],
      len = composers.length;

      return composers[Math.floor(Math.random() * len)];
    },

    render: function () {
      var composer = this.composerGenerator();
      return (
        <div className="container">
          <h1>{composer}App</h1>
          <h5><em>
            you are literally {composer}
          </em></h5>
          <div className="keyboard keyboard-upper">
          {
            Object.keys(window.UPPER_TONES).map(function (tone, idx) {
              return <Key noteName={tone} key={idx}/>;
            })
          }
          </div>

          <br/><br/>
          <div className="keyboard keyboard-lower">
          {
            Object.keys(window.LOWER_TONES).map(function (tone, idx) {
              return <Key noteName={tone} key={idx}/>;
            })
          }
          </div>
          <br/><br/>
          <Recorder className="Recorder" />
        </div>
      );
    }
  });
}(this));
