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

o1 = Owner.find_or_create_by_netid  'sy23'
o2 = Owner.find_or_create_by_netid  'alb64'
o3 = Owner.find_or_create_by_netid  'icc7'
o4 = Owner.find_or_create_by_netid  'lt275'
o5 = Owner.find_or_create_by_netid  'rx8'
o6 = Owner.find_or_create_by_netid  'ft66'
o7 = Owner.find_or_create_by_netid  'jmq23'
o8 = Owner.find_or_create_by_netid  'ayl8'

p1.owners + [o1, o3, o5, o7]
p1.save
p2.owners + [o1, o2, o5, o6]
p2.save
p3.owners + [o2, o3, o4, o7, o8]
p3.save


