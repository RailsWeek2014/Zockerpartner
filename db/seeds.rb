# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#User aEinträge nlegen
pw1 = "12345678"
u1 = User.create(email: "yysfsfsyy@wer.de", name: "Olaf", age: 21, password: pw1, password_confirmation: pw1)
u2 = User.create(email: "yyyy@wer.de", name: "Peter", age: 29, password: pw1, password_confirmation: pw1)

#Freundschaften von Usern anlegen
f = Friendship.create(user: u1, friend: u2)
f2 = Friendship.create(user: u2, friend: u1)

#Spiele Einträge anlegen
Game.create(name: "LOL")
Game.create(name: "CS")
Game.create(name: "BF3")

#User spiel Spiele Einträge anlegen
GameUser.create(user_id: 1, game_id: 1)
GameUser.create(user_id: 1, game_id: 2)
GameUser.create(user_id: 1, game_id: 3)
GameUser.create(user_id: 2, game_id: 2)
GameUser.create(user_id: 2, game_id: 3)

#Kommentare
Comment.create(user_id: 1, gameuser_id: 4, comment: "NOOB + flamer")
Comment.create(user_id: 1, gameuser_id: 5, comment: "Super Spieler + flamer")
Comment.create(user_id: 2, gameuser_id: 1, comment: "Schlecht + freundlich")
