# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "Davis", phone: "444-444-4444", email: "davis@mail.com", password: "password", group_id: 1, is_instructor: false)
User.create(name: "Jadzia", phone: "111-111-1111", email: "jadzia@mail.com", password: "password", group_id: 2, is_instructor: false)
User.create(name: "Dillon", phone: "222-222-2222", email: "dillon@mail.com", password: "password", group_id: 3, is_instructor: false)
User.create(name: "Ben", phone: "333-333-3333", email: "ben@mail.com", password: "password", group_id: 4, is_instructor: false)
User.create(name: "James", phone: "555-555-5555", email: "james@mail.com", password: "password", group_id: nil, is_instructor: true)


Group.create(name: "The Lodge", owner_id: 1)
Group.create(name: "Seacliffs", owner_id: 2)
Group.create(name: "Ocean", owner_id: 3)
Group.create(name: "The Meadow", owner_id: 4)

Issue.create(title: "Enumerables", description: "Cant wrap my head around them, help", user_id: 1)
Issue.create(title: "Ajax", description: "Anyone else having trouble targeting that thing in the checkpoint?", user_id: 2)
Issue.create(title: "AJax vs JQuery", description: "When do you use Ajax over JQuery", user_id: 3)
Issue.create(title: "Rails", description: "I hate rails so much someone help me", user_id: 4)

Comment.create(issue_id: 1, description: "ask james for help", user_id: 1)
Comment.create(issue_id: 2, description: "idk what to do", user_id: 2)
Comment.create(issue_id: 3, description: "i like pizza", user_id: 3)
Comment.create(issue_id: 4, description: "ask davis for help he knows everything", user_id: 4)
Comment.create(issue_id: 1, description: "I like pizza", user_id: 1)
Comment.create(issue_id: 2, description: "breh", user_id: 2)
Comment.create(issue_id: 3, description: "oatmeal raisin cookies are bomb", user_id: 3)
Comment.create(issue_id: 4, description: "yea idk how to help", user_id: 4)


