var TodoForm = React.createClass({
  getInitialState: function () {
    return {title: "", body: ""};
  },
  updateTitle: function (e) {
    this.setState({title: e.target.value});
  },
  updateBody: function (e) {
    this.setState({body: e.target.value});
  },

  handleSubmit: function (e) {
    e.preventDefault();
    TodoStore.create({title: this.state.title, body: this.state.body, done: false});
    this.setState({title: "", body: ""});
  },
  render: function () {
    return (
      <form onSubmit={this.handleSubmit}>
        Title
        <input className="text"
               value={this.state.title}
               onChange={this.updateTitle} />
        Body
        <input className="textarea"
               value={this.state.body}
               onChange={this.updateBody} />
        <button >Submit</button>
      </form>
    );
  }
});
