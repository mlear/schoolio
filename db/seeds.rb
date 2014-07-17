# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
num = 0

50.times {
	num += 1
	Grade.create(user_id: num, course_id: num, gpa: 3.5)
}

50.times {
	num = rand(1..10)
	Course.create(name: "test #{num}" , subject: "math")
}