# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

alex = User.create(first_name: "Alex", last_name: "Bannon", username: "alexbannon", email: "alexbannon@gmail.com", password_digest: BCrypt::Password.create("alexbannon"))
bday = alex.events.create(title: "Alex's Birthday Party!", event_content: "My awesome 26th bday party!")
first_post = Post.create(user_id: alex.id, event_id: bday.id, post_content: "Me at the party", image_url: "http://www.fillmurray.com/600/600")
first_comment = first_post.comments.create(user_id: alex.id, comment_content: "WOOO")
