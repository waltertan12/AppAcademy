/* global React */
var TodoDetailView = React.createClass({
  getInitialState: function() {
    return { stepbody: "", stepNumber: "" };
  },

  handleDone: function (id) {
    StepStore.toggleDone(id);
  },

  handleDelete: function(id) {
    StepStore.destroy(id);
  },

  handleSubmit: function(e) {
    e.preventDefault();
    StepStore.create({todo_id: this.props.todo.id,
                      stepbody: this.state.stepbody,
                      step_number: this.state.stepNumber
    });
  },

  handleUserInput: function(e) {
    this.setState({stepbody: e.target.value});
  },

  render: function () {
    return (
      <div>
        <div>{this.props.todo.body}</div>
        {
          StepStore.all()[this.props.id].map(function(step) {
            return (
              <div>
                {step}
                <button onClick={this.handleDone.bind(null, step.id)}>Done</button>
                <button onClick={this.handleDelete.bind(null, step.id)}>Delete</button>
              </div>
            );
          }.bind(this))
        }
        <form onSubmit={this.handleSubmit}>
          Step Body
          <input onChange={this.handleUserInput} value={this.state.stepbody}></input>
          Step Number
          <input onChange={this.handleStepInput} value={this.state.stepNumber}></input>
          <button>Submit</button>
      </form>
        <button onClick={this.props.handleDestroy}>Delete</button>
      </div>
    )
  }
});
