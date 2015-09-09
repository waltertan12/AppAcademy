require 'singleton'
require 'sqlite3'
require_relative 'model_manifest'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')

    self.results_as_hash = true
    self.type_translation = true
  end
end

if __FILE__ == $PROGRAM_NAME
  # p "User::find_by_id(1)"
  # p User.find_by_id(1)
  #
  # p "Question::find_by_author_id(1)"
  # q = Question.find_by_author_id(1)
  # p q
  #
  # p "Reply::find_by_user_id"
  # p Reply.find_by_user_id(2)
  #
  # p "Reply::find_by_question_id"
  # p Reply.find_by_question_id(1)
  #
  # p "User::find_by_name"
  # ned = User.find_by_name("Ned", "Stark")
  # p ned
  #
  # p "User#authored_questions"
  # p ned.authored_questions
  #
  # p "User#authored_replies"
  # p User.find_by_id(2).authored_replies
  #
  # p "Question#author"
  # p q.first.author
  #
  # p "Question#replies"
  # p q.first.replies
  #
  # p "Reply#author"
  # p Reply.find_by_id(1).author
  #
  # p "Reply#question"
  # p Reply.find_by_id(1).question
  #
  # p "Reply#parent_reply"
  # p Reply.find_by_id(2).parent_reply
  #
  # p "Reply#child_replies"
  # p Reply.find_by_id(1).child_replies
  #
  # # p "QuestionFollow::followers_for_question_id"
  # # p "QuestionFollow::followed_questions_for_user_id"
  #
  # p "User#followed_questions"
  # p ned.followed_questions
  #
  # p "Question#followers"
  # p q.first.followers
  #
  # p "Questions::most_followed"
  # p Question.most_followed(1)
  #
  # p "Question#likers"
  # p q.first.likers
  #
  # p "Question#num_likes"
  # p q.first.num_likes
  #
  # p "Question#liked_questions"
  # p ned.liked_questions
  #
  # p "Questions::most_liked"
  # p Question.most_liked(1)
  #
  # p "User#average_karma"
  # p ned.average_karma

  p "testing save function for user"
  new_user = User.new({"fname" => "James", "lname" => "Peach"})
  new_user.save
  p User.find_by_id(4)

  p "testing update function for user"
  new_user.fname = "Bill"
  new_user.save
  # p Reply.find_by_id(1)
  p User.find_by_id(4)
  # #

  # "testing update function for user"
  #  new_question = Question.new({'title' => "wow", 'body' => "hmm?", 'author_id' => 1})
  #  new_question.save

  # p "Reply::find_by_id(1)"
  # p Reply.find_by_id(1)
  #
  # p "User::find_by_id(1)"
  # p User.find_by_id(1)
  #
  # p "Question::find_by_id(1)"
  # p Question.find_by_id(1)
end
