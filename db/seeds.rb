# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.create(username: 'test', password: 'test', points: 0, win: 0, loss: 0)
b = User.create(username: 'b', password: 'password', points: 0, win: 0,  loss: 0)
a = User.create(username: 'a', password: 'password', points: 0, win: 0,  loss: 0)
c = User.create(username: 'c', password: 'password', points: 0, win: 0,  loss: 0)
d = User.create(username: 'd', password: 'password', points: 0, win: 0,  loss: 0)
e = User.create(username: 'e', password: 'password', points: 0, win: 0,  loss: 0)
f = User.create(username: 'f', password: 'password', points: 0, win: 0,  loss: 0, game_id: 1)
g = User.create(username: 'g', password: 'password', points: 0, win: 0,  loss: 0, game_id: 1)

Game.destroy_all
Game.create()

# game: only has an id. Has a has_many association with users
# user: has id, username, password_digest, game_id, points, wins, losses
# user belongs_to game, but it's optional (a user can sign up/exist without  a current game)

# when the schema works, uncomment these seeds:
# a = User.create(username: 'a', password: 'password', points: 0, wins: 0,  losses: 0)
# b = User.create(username: 'b', password: 'password', points: 0, wins: 0,  losses: 0)
# c = User.create(username: 'c', password: 'password', points: 0, wins: 0,  losses: 0)
# d = User.create(username: 'd', password: 'password', points: 0, wins: 0,  losses: 0)
# e = User.create(username: 'e', password: 'password', points: 0, wins: 0,  losses: 0)
#
g1 = Game.create()
a.game = g1
b.game = g1

g2 = Game.create()
c.game = g2
d.game = g2

puts "seeds done"
