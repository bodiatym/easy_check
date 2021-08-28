user = User.create(email: Faker::Internet.email, password: '123456')
user.confirm

test_1 = Test.create(user_id: user.id, name: Faker::Name.name)

question_1 = Question.create(body: Faker::Hipster.sentence(word_count: 3), answer_type: Question.answer_types[:single])
question_2 = Question.create(body: Faker::Hipster.sentence(word_count: 3), answer_type: Question.answer_types[:single])
question_3 = Question.create(body: Faker::Hipster.sentence(word_count: 3), answer_type: Question.answer_types[:multiple])
question_4 = Question.create(body: Faker::Hipster.sentence(word_count: 3), answer_type: Question.answer_types[:text])
question_5 = Question.create(body: Faker::Hipster.sentence(word_count: 3), answer_type: Question.answer_types[:multiple])

QuestionsTest.create(test_id: test_1.id, question_id: question_1.id)
QuestionsTest.create(test_id: test_1.id, question_id: question_2.id)
QuestionsTest.create(test_id: test_1.id, question_id: question_3.id)
QuestionsTest.create(test_id: test_1.id, question_id: question_4.id)
QuestionsTest.create(test_id: test_1.id, question_id: question_5.id)

AnswerOption.create(correct: true, body: Faker::Lorem.characters(number: 5), question_id: question_1.id)
AnswerOption.create(correct: false, body: Faker::Lorem.characters(number: 5), question_id: question_1.id)
AnswerOption.create(correct: false, body: Faker::Lorem.characters(number: 5), question_id: question_1.id)

AnswerOption.create(correct: false, body: Faker::Lorem.characters(number: 10), question_id: question_2.id)
AnswerOption.create(correct: true, body: Faker::Lorem.characters(number: 10), question_id: question_2.id)
AnswerOption.create(correct: false, body: Faker::Lorem.characters(number: 10), question_id: question_2.id)

AnswerOption.create(correct: false, body: Faker::Lorem.characters(number: 10), question_id: question_3.id)
AnswerOption.create(correct: false, body: Faker::Lorem.characters(number: 10), question_id: question_3.id)
AnswerOption.create(correct: true, body: Faker::Lorem.characters(number: 10), question_id: question_3.id)
AnswerOption.create(correct: true, body: Faker::Lorem.characters(number: 10), question_id: question_3.id)

AnswerOption.create(correct: true, body: Faker::Lorem.characters(number: 10), question_id: question_5.id)
AnswerOption.create(correct: true, body: Faker::Lorem.characters(number: 10), question_id: question_5.id)
AnswerOption.create(correct: false, body: Faker::Lorem.characters(number: 10), question_id: question_5.id)
AnswerOption.create(correct: false, body: Faker::Lorem.characters(number: 10), question_id: question_5.id)
