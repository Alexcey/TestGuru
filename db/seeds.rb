# Create a dataset
# run console: rails db:drop db:create db:migrate db:seed
puts 'start db:seed'

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Database' }
                              ])

users = User.create!([
                       #{ password: '123123', email: 'alex@ya.ru' },
                       { password: '123123', email: 'alex@ya.ru' }
                     ])

admin = Admin.create!([
                       { email: 'leshasv2307@gmail.com', password: '123123',
                         last_name: 'Last_name', first_name: 'First_name' }
                     ])

tests = Test.create!([
                       { category_id: categories[0].id, title: 'JS', level: 1, author: admin[0] },
                       { category_id: categories[1].id, title: 'Ruby', level: 2, author: admin[0] },
                       { category_id: categories[2].id, title: 'SQL', level: 3, author: admin[0] }
                     ])

questions = Question.create!([
                               { test_id: tests[0].id, body: 'JS is hard?' },
                               { test_id: tests[0].id, body: 'console.log(null == undefined)?' },
                               { test_id: tests[0].id, body: 'console.log(null === undefined)?' },
                               { test_id: tests[1].id, body: 'Ruby is beautiful?' },
                               { test_id: tests[2].id, body: 'SQL is best?' }
                             ])

Answer.create!([
                 { question_id: questions[0].id, body: 'Yes', correct: true },
                 { question_id: questions[0].id, body: 'No', correct: false },
                 { question_id: questions[1].id, body: 'True', correct: true },
                 { question_id: questions[1].id, body: 'False', correct: false },
                 { question_id: questions[2].id, body: 'True', correct: false },
                 { question_id: questions[2].id, body: 'False', correct: true },
                 { question_id: questions[3].id, body: 'Yep!', correct: true },
                 { question_id: questions[4].id, body: 'No', correct: false },
                 { question_id: questions[4].id, body: 'Yes', correct: true },
                 { question_id: questions[4].id, body: 'No', correct: false }
               ])

# TestPassage.create!([
#                       { user_id: users[0].id, test_id: tests[0].id, current_question_id: questions[2].id },
#                       { user_id: users[0].id, test_id: tests[0].id, current_question_id: questions[2].id },
#                       { user_id: users[2].id, test_id: tests[1].id, current_question_id: questions[2].id }
#                     ])

puts 'end db:seed'
