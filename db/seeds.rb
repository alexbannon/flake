# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

alex = User.create(first_name: "Alex", last_name: "Bannon", username: "alexbannon", email: "alexbannon@gmail.com", password_digest: BCrypt::Password.create("alexbannon"))
bday = Event.create(title: "Alex's Birthday Party!", event_content: "My awesome 27th bday party!", event_image_url: "http://www.fillmurray.com/600/600", event_time: "20151024 12:00")
happy_hour = Event.create(title: "Amazing Happy Hour!", event_content: "WOOO HAPPY HOUR", event_image_url: "http://www.stevensegallery.com/800/800", event_time: "20150915 19:00")
alex_going_to_bday = Attendance.create(user: alex, event: bday)
alex.attendances.create(event: happy_hour)
first_post = Post.create(user_id: alex.id, event_id: bday.id, post_content: "Me at the party", image_url: "http://www.fillmurray.com/600/600")
first_comment = first_post.comments.create(user_id: alex.id, comment_content: "WOOO")
erica = User.create(first_name: "Erica", last_name: "Anderson", username: "ericaanderson", email: "ericaanderson@gmail.com", password_digest: BCrypt::Password.create("ericaanderson"))
testuser = User.create(first_name: "Test", last_name: "User", username: "testuser", email: "test@gmail.com", password_digest: BCrypt::Password.create("testuser"))
zootrip = Event.create(title: "Zoo Trip!", event_content: "An amazing trip to the zoo", event_image_url: "http://www.sfzoo.org/images/v2/savanna.jpg", event_time: "20150813 13:30")
erica.attendances.create(event: zootrip)
testuser.attendances.create(event: happy_hour)
