# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

wow = User.create!(user_name: "wow",
                   password_digest: BCrypt::Password.create("password"))
mom = User.create!(user_name: "mom",
                   password_digest: BCrypt::Password.create("password"))

wilfred = Cat.create!(birth_date: 247.years.ago,
                      color: "orange",
                      name: "Wilfred",
                      sex: "M",
                      description: "Wilfred is super duper old",
                      user_id: wow.id)

geraldine = Cat.create!(birth_date: 400.years.ago,
                        color: "black",
                        name: "Geraldine",
                        sex: "F",
                        description: "Geraldine is stupid old",
                        user_id: mom.id)
