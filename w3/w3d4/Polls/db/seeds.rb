# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_one = User.create!(user_name: "fred")
user_two = User.create!(user_name: "ned")
user_three = User.create!(user_name: "zed")

poll_one = Poll.create!(title: "Countries", author_id: user_one.id)
poll_two = Poll.create!(title: "Animals", author_id: user_two.id)

q_one = Question.create!(poll_id: poll_one.id, body: "What's your favorite country?")
q_two = Question.create!(poll_id: poll_two.id, body: "What's your favorite animal?")

ac_one = AnswerChoice.create!(question_id: q_one.id, body: "Cuba")
ac_two = AnswerChoice.create!(question_id: q_one.id, body: "USA")
ac_three = AnswerChoice.create!(question_id: q_one.id, body: "Holland")
ac_four = AnswerChoice.create!(question_id: q_two.id, body: "Cat")

r_one = Response.create!(user_id: user_one.id, answer_choice_id: ac_one.id)
r_two = Response.create!(user_id: user_two.id, answer_choice_id: ac_one.id)
r_three = Response.create!(user_id: user_one.id, answer_choice_id: ac_four.id)
r_four = Response.create!(user_id: user_three.id, answer_choice_id: ac_three.id)
