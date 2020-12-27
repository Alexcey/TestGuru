# Create a dataset
# run console: rails db:drop db:create db:migrate db:seed
puts 'start db:seed'

categories = Category.create!([{ title: 'Frontend' }, { title: 'Backend' }])

User.create!([{ password: '123123', email: 'alex13@ya.ru' }])
admin = Admin.create!(password: '123123', email: 'alex12@ya.ru',
                      first_name: 'Admin', last_name: 'Admin')

tests = Test.create!([
                       { category_id: categories[0].id, title: 'JS', level: 1, author_id: admin.id },
                       { category_id: categories[1].id, title: 'Ruby', level: 2, author_id: admin.id }
                     ])

questions = Question.create!([
                               { test_id: tests[0].id, body: 'JS is hard?' },
                               { test_id: tests[0].id, body: 'console.log(null == undefined)?' },
                               { test_id: tests[0].id, body: 'console.log(null === undefined)?' },
                               { test_id: tests[1].id, body: 'Ruby is beautiful?' }
                             ])

Answer.create!([
                 { question_id: questions[0].id, body: 'Yes', correct: true },
                 { question_id: questions[0].id, body: 'No', correct: false },
                 { question_id: questions[1].id, body: 'True', correct: true },
                 { question_id: questions[1].id, body: 'False', correct: false },
                 { question_id: questions[2].id, body: 'True', correct: false },
                 { question_id: questions[2].id, body: 'False', correct: true },
                 { question_id: questions[3].id, body: 'Yep!', correct: true },
                 { question_id: questions[3].id, body: 'No', correct: false }
               ])

puts 'end db:seed'