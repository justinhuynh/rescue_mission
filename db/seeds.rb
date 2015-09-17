# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
question_attributes = {
  title: "#{Faker::Lorem.characters(60)}",
  description: "#{Faker::Lorem.characters(160)}",
  user_id: "#{rand(10)}"
}
  Question.create(question_attributes)
end

10.times do
user_attributes = {
  name: "#{Faker::Name.name}"
}
  User.create(user_attributes)
end
