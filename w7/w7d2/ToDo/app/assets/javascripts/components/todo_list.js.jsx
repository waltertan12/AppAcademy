/* global React */
var TodoList = React.createClass({
  getInitialState: function() {
    return { todos: TodoStore.all() };
  },

  todosChanged: function() {
    this.setState({todos: TodoStore.all()});
  },

  componentDidMount: function() {
    TodoStore.addChangedHandler(this.todosChanged);
    TodoStore.fetch();
  },

  componentWillUnmount: function() {
    TodoStore.removeChangedHandler(this.todosChanged);
  },

  render: function() {
    return (
      <div>
        {
          this.state.todos.map(function(todo) {
            return <TodoListItem className="todo-list-item"
                                 key={todo.id} todo={todo} />;
          })
        }
        <TodoForm />
      </div>
    );
  }
});
