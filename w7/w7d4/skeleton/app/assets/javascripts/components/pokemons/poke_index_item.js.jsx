/* global React */

(function(root) {
  'use strict';
  if (typeof root.PokemonsIndexItem === "undefined") {
    root.PokemonsIndexItem = {};
  }

  root.PokemonsIndexItem = React.createClass({
    mixins: [ReactRouter.History],
    showDetail: function () {
      this.history.pushState(null, "pokemon/" + this.props.pokemon.id)
    },
    render: function () {
      return (
          <li className='poke-list-item'
              onClick={this.showDetail}>
            {this.props.pokemon.name},
            {this.props.pokemon.poke_type}
          </li>
      );
    }
  });

}(this));
