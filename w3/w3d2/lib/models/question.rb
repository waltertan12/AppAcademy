require_relative '../questions_database'
require_relative 'model_base'

class Question < ModelBase
  attr_accessor :id, :title, :body, :author_id
  TABLE = 'questions'

  def self.find_by_author_id(author_id)
    question_hashes = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL

    question_hashes.map do |hash|
      Question.new(hash)
    end
  end

  def initialize(options = {})
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    User.find_by_id(author_id)
  end

  def replies
    Reply.find_by_question_id(id)
  end

  def followers
    QuestionFollow.followers_for_question_id(id)
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def likers
    QuestionLike.likers_for_question_id(id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(id)
  end
end
