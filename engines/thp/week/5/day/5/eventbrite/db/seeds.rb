# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Eventbrite::User.create
Eventbrite::User.create
Eventbrite::User.create
Eventbrite::User.create
Eventbrite::User.create


Eventbrite::Event.create(creator_id:1)
Eventbrite::Event.create(creator_id:2)
Eventbrite::Event.create(creator_id:3)
Eventbrite::Event.create(creator_id:4)
Eventbrite::Event.create(creator_id:1)
Eventbrite::Event.create(creator_id:4)
Eventbrite::Event.create(creator_id:0)  #must be error
Eventbrite::Event.create(creator_id:6)  #must be error
Eventbrite::Event.create(creator_id:7)  #must be error
Eventbrite::Event.create  #must be error

Eventbrite::User.all.first.created_events.count  #must be 2
