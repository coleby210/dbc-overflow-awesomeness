require 'faker'

#CLEAR DATABASE BEFORE SEEDING!
# Hard-coded single set

user = User.new(
  first_name: "Test",
  last_name: "Person",
  email: "test@email.com",
  password_hash: '1234'
  )
user.save

Question.create(
  user_id: 1,
  title: 'Test Question Title',
  body: 'This is example text for the test question'
  )

Answer.create(
  user_id: 1,
  question_id: 1,
  body: 'This is a test answer to the first question'
  )

Comment.create(
  user_id: 1,
  commentable_id: 1,
  commentable_type: 'Question',
  body: 'This is a test comment for first Question'
  )

Comment.create(
  user_id: 1,
  commentable_id: 1,
  commentable_type: 'Answer',
  body: 'This is a test comment for first Answer'
  )

Vote.create(
  user_id: 1,
  votable_id: 1,
  votable_type: 'Question',
  positive: true
  )

Vote.create(
  user_id: 1,
  votable_id: 1,
  votable_type: 'Answer',
  positive: true
  )

# ---------------
# rando set
# -------------

5.times do |i|
  user = User.new(
    first_name: Faker::Name.name ,
    last_name: Faker::Address.state,
    email: Faker::Internet.email,
    password_hash: '1234'
  )
  user.save
end

10.times do |i|
  Question.create(
    user_id: (rand(6) + 1),
    title: Faker::Hacker.ingverb.capitalize + ' ' + Faker::Hacker.adjective + ' ' + Faker::Hacker.noun,
    body: Faker::Lorem.paragraph + "?"
  )
end

10.times do |i|
Answer.create(
  user_id: (rand(6) + 1),
  question_id: (i + 1),
  body: Faker::Hacker.say_something_smart
  )
end

20.times do |i|
Comment.create(
  user_id: (rand(6) + 1),
  commentable_id: (rand(10) + 1),
  commentable_type: ['Question','Answer'].sample,
  body: Faker::Hacker.say_something_smart
  )
end

40.times do |i|
Vote.create(
  user_id: (rand(6) + 1),
  votable_id: (rand(10) + 1),
  votable_type: ['Question','Answer'].sample,
  positive: [true,false].sample
  )
end


