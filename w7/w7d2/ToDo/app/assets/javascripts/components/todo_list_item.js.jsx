/* global React */
var TodoListItem = React.createClass({
  getInitialState: function () {
    return { hidden: true };
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
        <div onClick={this.handleDetail}>{this.props.todo.title}</div>
        <DoneButton todo={this.props.todo}/>
        {detailView}
      </div>
    );
  }
});
