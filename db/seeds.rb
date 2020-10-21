# Create a dataset
# run console: rails db:drop db:create db:migrate db:seed
puts 'start db:seed'

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Database' }
                              ])

users = User.create!([
                       { username: 'Alex', password: '1', email: 'alex@ya.ru' },
                       { username: 'Anton', password: '2', email: 'anton@ya.ru' },
                       { username: 'Admin', password: 'Admin', email: 'admin@ya.ru' }
                     ])

tests = Test.create!([
                       { category_id: categories[0].id, title: 'JS', level: 1, author: users[2] },
                       { category_id: categories[1].id, title: 'Ruby', level: 2, author: users[2] },
                       { category_id: categories[2].id, title: 'SQL', level: 3, author: users[2] }
                     ])

questions = Question.create!([
                               { test_id: tests[0].id, body: 'JS is hard?' },
                               { test_id: tests[1].id, body: 'Ruby is beautiful?' },
                               { test_id: tests[2].id, body: 'SQL is best?' }
                             ])

Answer.create!([
                 { question_id: questions[0].id, body: 'Yes', correct: true },
                 { question_id: questions[0].id, body: 'No', correct: false },
                 { question_id: questions[1].id, body: 'Yep!', correct: true },
                 { question_id: questions[2].id, body: 'Yes', correct: true },
                 { question_id: questions[2].id, body: 'No', correct: false }
               ])

TestPass.create!([
                   { user_id: users[0].id, test_id: tests[0].id },
                   { user_id: users[0].id, test_id: tests[0].id },
                   { user_id: users[2].id, test_id: tests[1].id }
                 ])

puts 'end db:seed'
