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
    result = Hash.new(0)

    choices = answer_choices.select("answer_choices.*, COUNT(answer_choices.id)").joins("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id").group("answer_choices.id")

    choices.each do |choice|
      result[choice.body] += 1
    end

    result
  end
end