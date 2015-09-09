require_relative '../questions_database'
require_relative 'model_base'

class QuestionFollow < ModelBase
  attr_accessor :id, :question_id, :user_id
  @table = 'question_follows'



  def initialize(options = {})
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  #returns an array of user objects
  def self.followers_for_question_id(question_id)
    hashes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_follows ON users.id = question_follows.user_id
      WHERE
        question_follows.question_id = ?
      SQL

      hashes.map do |hash|
        User.new(hash)
      end
  end

  def self.follow_guestion_for_user_id(user_id)
    hashes = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?
      SQL

    hashes.map do |hash|
      Question.new(hash)
    end
  end

  # Fetches the n most followed question
  def self.most_followed_questions(n)
    question_hashes = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
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
end
