# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  poll_id    :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  validates :poll_id, presence: true
  validates :body,    presence: true

  belongs_to(
    :poll,
      class_name: "Poll",
      foreign_key: :poll_id,
      primary_key: :id
  )

  has_many(
    :answer_choices,
    class_name: "AnswerChoice",
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :responses,
      through: :answer_choices,
      source: :responses
  )

  def results
    responses = answer_choices.includes(:responses)
    result = {}

    sql_command = <<-SQL
      SELECT
        answer_choices.*,
        COUNT(responses.id)
      FROM
        answer_choices
      LEFT OUTER JOIN
        questions ON answer_choices.question_id = questions.id
      GROUP BY
        answer_choices.id
    SQL

    answer_choices
      .includes(:responses)
      .select("answer_choices.*, COUNT(responses.id)")
      .joins("LEFT OUTER JOIN questions ON questions.id = answer_choices.question_id")
      .group("answer_choices.id")


    Question
      .select("answer_choices.*, COUNT(answer_choices.id)")
      .join("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id")

    answer_choices.includes(:responses)

    answer_choices
      .select("answer_choices.body")
      .joins("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id")
      .where("answer_choices.question_id = #{Question.first.id}")
      .group("responses.id")
      .count


    responses.each do |response|
      result[response.body] = response.responses.length
    end

    result
  end