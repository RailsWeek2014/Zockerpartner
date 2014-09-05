# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
pw1 = "12345678"
u1 = User.create(email: "yysfsfsyy@wer.de", password: pw1, password_confirmation: pw1)
u2 = User.create(email: "yyyy@wer.de", password: pw1, password_confirmation: pw1)
f = Friendship.create(user: u1, friend: u2)
f2 = Friendship.create(user: u2, friend: u1)