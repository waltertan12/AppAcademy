require_relative '../questions_database'
require_relative 'model_base'

class Reply < ModelBase
  attr_accessor :id, :body, :question_id, :user_id, :parent_id
  @table = 'replies'

  def initialize(options = {})
    @id = options['id']
    @body = options['body']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @parent_id = options['parent_id']
  end

  def self.find_by_user_id(user_id)
    reply_hashes = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    reply_hashes.map do |hash|
      Reply.new(hash)
    end
  end

  def self.find_by_question_id(question_id)
    reply_hashes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    reply_hashes.map do |hash|
      Reply.new(hash)
    end
  end

  def author
    User.find_by_id(user_id)
  end

  def question
    Question.find_by_id(question_id)
  end

  def parent_reply
    Reply.find_by_id(parent_id)
  end

  def child_replies
    reply_hashes = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL

    reply_hashes.map do |hash|
      Reply.new(hash)
    end
  end
end
