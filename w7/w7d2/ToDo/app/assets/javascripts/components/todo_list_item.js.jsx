/* global React */
var TodoListItem = React.createClass({
  getInitialState: function () {
    return { hidden: true };
  },

  componentDidMount: function () {

  },
  
  handleDestroy: function () {
    TodoStore.destroy(this.props.todo.id);
  },

  handleDetail: function (e) {
    var hidden = (this.state.hidden ? false : true);
    this.setState({hidden: hidden});
  },

  render: function () {
    var detailView;
    if (this.state.hidden) {
      detail = "";
    } else {
      detailView = <TodoDetailView todo={this.props.todo}
                                   handleDestroy={this.handleDestroy}/>;
    }
    return (
      <div>
        <h2 className="todo-list-item" 
            onClick={this.handleDetail}>{this.props.todo.title}</h2>
        <DoneButton todo={this.props.todo}/>
        {detailView}
      </div>
    );
  }
});
