var DoneButton = React.createClass({
  handleDone: function () {
    TodoStore.toggleDone(this.props.todo.id);
  },
  render: function () {
    var buttonText;
    if (this.props.todo.done) {
      buttonText = "Undo";
    } else {
      buttonText = "Done";
    }

    return (
      <button onClick={this.handleDone}>{buttonText}</button>
    );
  }
});
