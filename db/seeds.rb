# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "dak@dallascowboys.com", name: "Dak", password: "cornflakes")
User.create(email: "andy@nosaints.com", name: "Andy", password: "honeybunches")
User.create(email: "lamar@bmoreravens.com", name: "Lamar", password: "raisinbran")
User.create(email: "joe@bengals.com", name: "Joe", password: "cinammontoastcrunch")
User.create(email: "kyler@azcardinals.com", name: "Kyler", password: "frootloops")
User.create(email: "pj@carpanthers.com", name: "PJ", password: "luckycharms")
User.create(email: "justin@lachargers.com", name: "Justin", password: "smacks")
User.create(email: "marcus@atlfalcons.com", name: "Marcus", password: "cornpops")
User.create(email: "trevor@jaxjags.com", name: "Trevor", password: "puffins")
User.create(email: "davis@houstontexans.com", name: "Davis", password: "reesespuffs")

Group.create(name: "Disney World", user_id: 23)

Friendship.create(user_id: 23, friend_id: 24)
Friendship.create(user_id: 23, friend_id: 25)
Friendship.create(user_id: 23, friend_id: 26)
Friendship.create(user_id: 23, friend_id: 27)
Friendship.create(user_id: 23, friend_id: 28)

Membership.create(user_id: 23, group_id: 3)
Membership.create(user_id: 24, group_id: 3)
Membership.create(user_id: 25, group_id: 3)
Membership.create(user_id: 26, group_id: 3)
Membership.create(user_id: 27, group_id: 3)
Membership.create(user_id: 28, group_id: 3)

Receipt.create(name: "Astro Orbiter", total: 25, user_id: 23, group_id: 3)
Receipt.create(name: "Cinderella Castle", total: 100, user_id: 23, group_id: 3)
Receipt.create(name: "Country Bear Jamboree", total: 40, user_id: 23, group_id: 3)
Receipt.create(name: "Lunch", total: 150, user_id: 23, group_id: 3)
Receipt.create(name: "It's a Small World", total: 35, user_id: 24, group_id: 3)
Receipt.create(name: "Splash Mountain", total: 10, user_id: 24, group_id: 3)
Receipt.create(name: "TRON ride", total: 50, user_id: 25, group_id: 3)
Receipt.create(name: "Dinner", total: 400, user_id: 26, group_id: 3)
Receipt.create(name: "Haunted Mansion", total: 25, user_id: 27, group_id: 3)
Receipt.create(name: "Jungle Cruise", total: 50, user_id: 28, group_id: 3)