(function(root) {
  'use strict';
  if (typeof root.StepStore === "undefined") {
    root.StepStore = {};
  }

  var _steps = [],
      _callbacks = [];

  root.StepStore = {
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
      return _steps;
    },

    fetch: function() {
      $.get('/api/steps', function(steps) {
        _steps = steps;
        root.StepStore.changed();
      });
    },

    create: function(todo) {
      $.post('/api/' + todo.id + '/steps', todo, function(todo) {
        _steps.push(todo);
        root.StepStore.changed();
      });
    },

    find: function (id) {
      for (var i = 0; i < _steps.length; i++) {
        if (_steps[i].id === id) {
          return i;
        }
      }
      return null;
    },

    destroy: function(id) {
      var index = root.StepStore.find(id);
      if (index !== null) {
        $.ajax({
          url: '/api/steps/' + id,
          type: 'DELETE',
          success: function (todo) {
            _steps.splice(index, 1);
            root.StepStore.changed();
          }
        });
      }
    },

    toggleDone: function (id) {
      var index = root.StepStore.find(id);
      if (index !== null) {
        var currentTodo = _steps[index];
        currentTodo.done = (currentTodo.done ? false : true);
        $.ajax({
          url: '/api/steps/' + id,
          type: 'PATCH',
          data: currentTodo,
          success: function (todo) {
            root.StepStore.changed();
          }
        });
      }
    }
  };

}(this));
