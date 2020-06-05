# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
  {name: "PVE"},
  {name: "PVP"},
  {name: "LS"},
  {name: "Sail"}
])

User.create({
  family_name: "Unevenly",
  password: "123456",
  discord_tag: "Seelen#2810",
  description: "Valkyries are armed with sword, shield, and divine magic. they can use their weapons to powerful blows to their enemies. they can also use their divine magic for healing and empowering allies. after awakening, they can use lancia, a weapon that is even taller than a valkyrie and greatly boosts her great offense and defense. valkyries are armed with sword, shield, and divine magic. they can use their weapons to powerful blows to their enemies. they can also use their divine magic for healing and empowering allies. after awakening, they can use lancia, a weapon that is even taller than a valkyrie and greatly boosts her great offense and defense. valkyries are armed with sword, shield, and divine magic. they can use their weapons to powerful blows to their enemies. they can also use their divine magic for healing and empowering allies. after awakening, they can use lancia, a weapon that is even taller than a valkyrie and greatly boosts her great offense and defense. valkyries are armed with sword, shield, and divine magic. they can use their weapons to powerful blows to their enemies. they can also use their divine magic for healing and empowering allies. after awakening, they can use lancia, a weapon that is even taller than a valkyrie and greatly boosts her great offense and defense.",
  atack: 283,
  atack_awake: 285,
  denfense: 331,
  branch: 0,
  avatar: "avatar_valkyrie_chibi.jpg",
  rank: "guild_master",
  build_url: "https://bdoplanner.com/HarborWeenieSacrament"
})
