# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#User aEinträge nlegen
pw1 = "12345678"
icon = "http://images.wikia.com/quake/images/archive/3/3b/20100623110043!Quake_Live_Logo.png"
u1 = User.create(email: "yysfsfsyy@wer.de", admin: false, name: "Olaf", age: 21, password: pw1, password_confirmation: pw1, avatar: icon)
u2 = User.create(email: "yyyy@wer.de", admin: true, name: "Peter", age: 29, password: pw1, password_confirmation: pw1, avatar: icon)
u3 = User.create(email: "Peter@thm.de", admin: false, name: "Sinth", age: 29, password: pw1, password_confirmation: pw1, description: "bla bla bla ein beschreibungstext erscheint in dieser textarea jonge", avatar: icon)

#Freundschaften von Usern anlegen
f = Friendship.create(user_id: u1.id, friend_id: u2.id)
f2 = Friendship.create(user_id: u2.id, friend_id: u1.id)
f3 = Friendship.create(user_id: u3.id, friend_id: u1.id)

#Spiele Einträge anlegen
Game.create(name: "LOL", icon: "http://bloodfighters.de/picture.php?id=19", description: "Spielebeschreibung Textarea Spielebeschreibung Textarea Spielebeschreibung Textarea")
Game.create(name: "CS", icon: "http://hypesrus.com/files/counter-strike-global-offensive-cs-go-logo.jpg", description: "Spielebeschreibung Textarea Spielebeschreibung Textarea Spielebeschreibung Textarea")
Game.create(name: "BF3", icon: "http://img1.wikia.nocookie.net/__cb20110920165739/battlefield/it/images/thumb/4/40/BF3_Logo_Horizontal.png/640px-BF3_Logo_Horizontal.png", description: "Spielebeschreibung Textarea Spielebeschreibung Textarea Spielebeschreibung Textarea")
Game.create(name: "Quake Live", icon: "http://images.wikia.com/quake/images/archive/3/3b/20100623110043!Quake_Live_Logo.png", description: "Spielebeschreibung Textarea Spielebeschreibung Textarea Spielebeschreibung Textarea")

#Ratings
Rating.create(game_user_id: 1, score: 0, user_id: 2)

#User spiel Spiele Einträge anlegen
GameUser.create(user_id: 1, game_id: 1, rating_id: 1, deleted: true)
GameUser.create(user_id: 1, game_id: 2, rating_id: 2, deleted: false)
GameUser.create(user_id: 1, game_id: 3, rating_id: 3)
GameUser.create(user_id: 2, game_id: 2, rating_id: 4)
GameUser.create(user_id: 2, game_id: 3, rating_id: 5)
GameUser.create(user_id: 3, game_id: 3, rating_id: 6)
GameUser.create(user_id: 3, game_id: 4, rating_id: 7)


#Kommentare
Comment.create(user_id: 1, gameuser_id: 4, comment_text: "NOOB + flamer")
Comment.create(user_id: 1, gameuser_id: 5, comment_text: "Super Spieler + flamer")
Comment.create(user_id: 2, gameuser_id: 1, comment_text: "Schlecht + freundlich")

