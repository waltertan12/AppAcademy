fred = User.create!(user_name: "Fred")
ned  = User.create!(user_name: "Ned")
zed  = User.create!(user_name: "Zed")
greg = User.create!(user_name: "Greg")

countires_poll = Poll.create!(title: "Countries", author_id: greg.id)
animal_poll    = Poll.create!(title: "Animals",   author_id: greg.id)

q_one = Question.create!(poll_id: countires_poll.id, 
                         body: "What's your favorite country?")
q_two = Question.create!(poll_id: animal_poll.id, 
                         body: "What's your favorite animal?")

ac_one   = AnswerChoice.create!(question_id: q_one.id, body: "Cuba")
ac_two   = AnswerChoice.create!(question_id: q_one.id, body: "USA")
ac_three = AnswerChoice.create!(question_id: q_one.id, body: "Holland")
ac_four  = AnswerChoice.create!(question_id: q_two.id, body: "Panda")
ac_five  = AnswerChoice.create!(question_id: q_two.id, body: "Kitten")

# Country Poll
Response.create!(user_id: fred.id, answer_choice_id: ac_one.id)
Response.create!(user_id: ned.id,  answer_choice_id: ac_two.id)
Response.create!(user_id: zed.id,  answer_choice_id: ac_three.id)

# Animal Poll
Response.create!(user_id: fred.id, answer_choice_id: ac_four.id)
Response.create!(user_id: ned.id,  answer_choice_id: ac_five.id)