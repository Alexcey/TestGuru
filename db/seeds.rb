# Create a dataset
# run console: rails db:create db:migrate db:seed

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Database' }
                              ])

User.create!([
               { username: 'Alex', password: '1' },
               { username: 'Anton', password: '2' },
               { username: 'Mark', password: '3' }
             ])

tests = Test.create!([
                       { category_id: categories[0].id, title: 'JS', level: 1 },
                       { category_id: categories[1].id, title: 'Ruby', level: 2 },
                       { category_id: categories[2].id, title: 'SQL', level: 3 }
                     ])

questions = Question.create!([
                               { test_id: tests[0].id, body: 'JS is hard?' },
                               { test_id: tests[1].id, body: 'Ruby is beautiful?' },
                               { test_id: tests[2].id, body: 'SQL is best?' }
                             ])

Answer.create!([
                 { question_id: questions[0], body: 'Yes', correct: true },
                 { question_id: questions[0], body: 'No', correct: false },
                 { question_id: questions[1], body: 'Yep!', correct: true },
                 { question_id: questions[2], body: 'Yes', correct: true },
                 { question_id: questions[2], body: 'No', correct: false }
               ])
