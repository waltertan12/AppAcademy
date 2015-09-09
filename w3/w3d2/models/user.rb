require_relative '../questions_database'
# require_relative '../model_manifest'
require_relative 'model_base'

class User < ModelBase
  attr_accessor :id, :fname, :lname
  TABLE = 'users'

  def self.find_by_name(fname, lname)
    user_hash =
      QuestionsDatabase.instance.execute(<<-SQL, fname: fname, lname: lname)
        SELECT
          *
        FROM
          users
        WHERE
          fname = :fname AND lname = :lname
    SQL

    User.new(user_hash.first)
  end

  def initialize(options = {})
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(id)
  end

  def authored_replies
    Reply.find_by_user_id(id)
  end

  def followed_questions
    QuestionFollow.follow_guestion_for_user_id(id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(id)
  end

  def average_karma
    karma = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        COUNT(DISTINCT questions.id) AS questions_asked,
        CAST(COUNT(*) AS FLOAT) AS total_likes
      FROM
        questions
      LEFT OUTER JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?
    SQL

    karma.first['total_likes'] / karma.first['questions_asked']
  end

  # def save
  #   if id
  #
  #     # Update
  #     QuestionsDatabase.instance.execute(<<-SQL, first_name: fname, last_name: lname, pk: id)
  #       UPDATE
  #         users
  #       SET
  #         fname = :first_name, lname = :last_name
  #       WHERE
  #         id = :pk
  #     SQL
  #   else
  #     # Insert
  #     args = {first_name: fname, last_name: lname}
  #     row_stuff = "fname, lname"
  #     # db = QuestionsDatabase.instance.execute(<<-SQL, first_name: fname, last_name: lname)
  #     db = QuestionsDatabase.instance.execute(<<-SQL, args)
  #       INSERT INTO
  #         users(#{row_stuff})
  #       VALUES
  #         (:first_name, :last_name)
  #     SQL
  #
  #     self.id = QuestionsDatabase.instance.last_insert_row_id
  #   end
  # end
end
