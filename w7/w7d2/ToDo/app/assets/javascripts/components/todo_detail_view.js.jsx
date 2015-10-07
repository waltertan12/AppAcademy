/* global React */
var TodoDetailView = React.createClass({
  getInitialState: function() {
    return { stepbody: "", stepNumber: "" };
  },

  handleUserInput: function(e) {
    this.setState({stepbody: e.target.value});
  },

  render: function () {
    return (
      <div>
        <p>{this.props.todo.body}</p>
        <StepList todo={this.props.todo} />
        <form onSubmit={this.handleSubmit}>

          Step Body
          <br/>
          <input onChange={this.handleUserInput} 
                 value={this.state.stepbody} />
          <br/>

          Step Number
          <br/>
          <input onChange={this.handleStepInput} 
                 value={this.state.stepNumber} />
          <br/>
          <button>Submit</button>
      </form>
        <button onClick={this.props.handleDestroy}>Delete</button>
      </div>
    )
  }
});
