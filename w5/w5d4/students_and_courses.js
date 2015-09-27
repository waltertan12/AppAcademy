var Student = function(fname, lname){
  this.name = fname + lname;
  this.courses = [];
};

var Course = function(name, credits, days, block){
  var DAYS = [ "M", "T", "W", "R", "F" ];
  var BLOCKS = [ 1, 2, 3, 4, 5, 6, 7, 8 ];

  var that = this;

  this.name = name;
  this.credits = credits;
  this.students = [];
  this.days = [];
  this.block = null;

  days.forEach(function(day) {
    if (DAYS.indexOf(day) > -1) {
      // console.log(this === day);

      that.days.push(day);
    }
  });

  if (BLOCKS.indexOf(block) > 0) {
    this.block = block;
  }
};

Student.prototype = {
  enroll: function(course){
    if (this.courses.indexOf(course) < 0){
      this.courses.push(course);
    }
  },
  courseLoad: function(){
    var result = {};
    this.courses.forEach(function(course){
      result[course.name] = course.credits;
    });
    return result;
  }
};

Course.prototype = {
  addStudent: function(student){
    this.students.push(student);
    student.enroll(this);
  }
};
var newStudent = new Student("bob", "bob2");
var newCourse = new Course("math", 500, ["M", "W", "F"], 3);
var newCourse2 = new Course("english", "9000", ["T", "R"], 3);

newCourse.addStudent(newStudent);
newCourse2.addStudent(newStudent);
console.log(newCourse);
console.log(newCourse2);
// console.log(newStudent.courses[0]);
// console.log(newStudent.courseLoad());
// console.log(newCourse.students);
