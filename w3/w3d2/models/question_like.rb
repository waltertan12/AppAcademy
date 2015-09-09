require_relative '../questions_database'
require_relative 'model_base'

class QuestionLike < ModelBase
  attr_accessor :id, :question_id, :user_id
  @table = 'question_likes'

  def self.likers_for_question_id(question_id)
    user_hashes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = ?
    SQL

    user_hashes.map do |hash|
      User.new(hash)
    end
  end

  def self.num_likes_for_question_id(question_id)
    num_likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*) AS likes
      FROM
        users
      JOIN
        question_likes ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = ?
    SQL

    num_likes.first["likes"]
  end

  def self.liked_questions_for_user_id(user_id)
    question_hashes = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?
    SQL

    question_hashes.map do |hash|
      Question.new(hash)
    end
  end

  def self.most_liked_questions(n)
    question_hashes = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
    SQL

    question_hashes.map do |question_hash|
      Question.new(question_hash)
    end
  end

  def initialize(options = {})
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end
