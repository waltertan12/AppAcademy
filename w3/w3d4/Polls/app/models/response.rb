# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ActiveRecord::Base
  validates :user_id, presence: true, 
                      uniqueness: { scope: :answer_choice_id }
  validates :answer_choice_id, presence: true
  validate  :respondent_has_not_already_answered_question,
            :respondent_did_not_make_poll

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :answer_choice,
    class_name: "AnswerChoice",
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  has_one(
    :poll,
    through: :question,
    source: :poll
  )

  private

  def sibling_responses
    question.responses.where("responses.id IS NOT ?", id)
  end

  def respondent_has_not_already_answered_question
    respondent = sibling_responses.any? do |sibling| 
      sibling.user_id == user_id
    end

    if respondent
      errors.add(:respondent, "can't answer a question more than once")
    end
  end

  def respondent_did_not_make_poll
    respondent = answer_choice.question.poll.author_id == user_id
    if respondent
      error.add(:respondent, "can't answer own poll")
    end
  end
end