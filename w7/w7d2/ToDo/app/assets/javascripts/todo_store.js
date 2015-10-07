(function(root) {
  'use strict';
  if (typeof root.TodoStore === "undefined") {
    root.TodoStore = {};
  }

  var _todos = [],
      _callbacks = [];

  root.TodoStore = {
    changed: function () {
      _callbacks.forEach(function (callback) {
        callback();
      });
    },

    addChangedHandler: function (callback) {
      _callbacks.push(callback);
    },

    removeChangedHandler: function (callback) {
      var index = _callbacks.indexOf(callback);
      if (index > -1) {
        _callbacks.splice(index, 1);
      }
    },

    all: function() {
      return _todos;
    },

    fetch: function() {
      $.get('/api/todos', function(todos) {
        _todos = todos;
        root.TodoStore.changed();
      });
    },

    create: function(todo) {
      $.post('/api/todos', todo, function(todo) {
        _todos.push(todo);
        root.TodoStore.changed();
      });
    },

    find: function (id) {
      for (var i = 0; i < _todos.length; i++) {
        if (_todos[i].id === id) {
          return i;
        }
      }
      return null;
    },

    destroy: function(id) {
      var index = root.TodoStore.find(id);
      if (index !== null) {
        $.ajax({
          url: '/api/todos/' + id,
          type: 'DELETE',
          success: function (todo) {
            _todos.splice(index, 1);
            root.TodoStore.changed();
          }
        });
      }
    },

    toggleDone: function (id) {
      var index = root.TodoStore.find(id);
      if (index !== null) {
        var currentTodo = _todos[index];
        currentTodo.done = (currentTodo.done ? false : true);
        $.ajax({
          url: '/api/todos/' + id,
          type: 'PATCH',
          data: currentTodo,
          success: function (todo) {
            root.TodoStore.changed();
          }
        });
      }
    }
  };

}(this));
