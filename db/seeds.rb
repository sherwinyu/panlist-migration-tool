# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p1 = Panlist.create name: 'directorslist', public: false, subscribers: "a@b.c\nd@e.f\ng@r.f" 
p2 = Panlist.create name: 'cat3rocks', public: false, subscribers: "coolcat@one.com\ncoolcat@two.com\ncoolcat@three.com" 
p3 = Panlist.create name: 'emilys-freshmen', public: true, subscribers: "aaa@b.c\nd@e.f\ng@r.f"

o1 = Owner.create netid: 'sy23'
o2 = Owner.create netid: 'alb64'
o3 = Owner.create netid: 'icc7'
o4 = Owner.create netid: 'lt275'
o5 = Owner.create netid: 'rx8'
o6 = Owner.create netid: 'ft66'
o7 = Owner.create netid: 'jmq23'
o8 = Owner.create netid: 'ayl8'

p1.owners << [o1, o3, o5, o7]
p2.owners << [o1, o2, o5, o6]
p3.owners << [o2, o3, o4, o7, o8]


