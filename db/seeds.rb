# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def time_rand from = Time.now - 1.day, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end

i=0
10.times do
    user_name = "user"+i.to_s
    user = User.create(name: user_name, email: user_name+"@gmail.com")
    j=0
    5.times do
      user.products.create(title: "title"+j.to_s, description: "description blabla", deadline: time_rand)
      j+=1
    end
i+=1
end