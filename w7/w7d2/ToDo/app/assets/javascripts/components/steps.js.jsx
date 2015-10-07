var StepList = React.createClass({
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
  render: function () {
    var allSteps = StepStore.all()[this.props.todo.id];
    if (typeof allSteps === "undefined") {
      allSteps = [];
    }
    console.log(allSteps);
    return (
      <div>
      {
        allSteps.map(function(step) {
                return (
                  <div>
                    {step}
                    <button onClick={this.handleDone.bind(null, step.id)}>
                      Done
                    </button>
                    <button onClick={this.handleDelete.bind(null, step.id)}>
                      Delete
                    </button>
                  </div>
                );
              }.bind(this))
      }
      </div>
    );
  }
});