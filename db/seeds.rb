# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

alex = User.create(first_name: "Frank", last_name: "Underwood", username: "frankunderwood", email: "frankunderwood@gmail.com", password_digest: BCrypt::Password.create("frankunderwood"))
bday = Event.create(title: "Alex's Birthday Party!", event_content: "My awesome 27th bday party!", event_image_url: "http://www.fillmurray.com/680/720", event_time: "20151024 12:00")
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
anothertestuser = User.create(first_name: "Another", last_name: "User", username: "anothertestuser", email: "anothertest@user.com", password_digest: BCrypt::Password.create("anothertestuser"))
bowling = Event.create(title: "Bowling Trip!", event_content: "Time to go bowling!", event_image_url: "http://www.willmar.k12.mn.us/cms/lib07/MN01909723/Centricity/Domain/741/IMG_3223.jpg", event_time: "20150901 13:00")
movies = Event.create(title: "Going to the movies", event_content: "Cruisin' for a Viewin'", event_image_url: "http://cdn3.denofgeek.us/sites/denofgeekus/files/mission-impossible-1996-tom-cruise-27898914-1200-785.jpg", event_time: "20150810 16:00")
school_afterparty = Event.create(title: "School Afterparty", event_content: "Gettin Crunk", event_image_url: "http://www.eatcleanlivehealthy.com/wp-content/uploads/2011/01/girl-drinking-water.jpg", event_time: "20150918 18:00")
golf = Event.create(title: "Time to Golf!", event_content: "Let's go play golf, guys!", event_image_url: "http://smock.foreuphosting5.com/wp-content/uploads/2015/04/tight.jpg", event_time: "20160101 00:01")
alex.attendances.create(event: school_afterparty)
anothertestuser.attendances.create(event: school_afterparty)
erica.attendances.create(event: school_afterparty)
testuser.attendances.create(event: school_afterparty)
alex.attendances.create(event: movies)
erica.attendances.create(event: movies)
alex.attendances.create(event: bowling)
erica.attendances.create(event: bowling)
testuser.attendances.create(event: golf)
anothertestuser.attendances.create(event: golf)
john = User.create(first_name: "Jonathan", last_name: "Papelbon", username: "iheartredsox", email: "pap@smear.com", password_digest: BCrypt::Password.create("iheartredsox"))
abby = User.create(first_name: "Abby", last_name: "Gorgonzola", username: "imagirl", email: "email@email.com", password_digest: BCrypt::Password.create("imagirl"))
ali = User.create(first_name: "Ali", last_name: "Tweedt", username: "alitweedt", email: "tweedta@gmail.com", password_digest: BCrypt::Password.create("alitweedt"))
dan = User.create(first_name: "Daniel", last_name: "Riley", username: "danriley", email: "danriley@gmail.com", password_digest: BCrypt::Password.create("danriley"))
chris = User.create(first_name: "Chris", last_name: "Gordon", username: "chrisgordon", email: "chrisgordon@gmail.com", password_digest: BCrypt::Password.create("chrisgordon"))
john.attendances.create(event: school_afterparty)
john.posts.create(event: school_afterparty, post_content: "Looking forward to funemployment", image_url: "http://33.media.tumblr.com/184c0d79d7d1cc25bd3824d2a65c718e/tumblr_mw49pt4SHf1qbtwyto1_r2_250.gif")
abby.attendances.create(event: school_afterparty)
abby.posts.create(event: school_afterparty, post_content: "OMG I am going to drink so much I forget all 12 weeks of school", image_url: "")
ali.attendances.create(event: school_afterparty)
ali.posts.create(event: school_afterparty, post_content: "Shots Shots Shots", image_url: "http://media.giphy.com/media/MhenSeT9i5Mnm/giphy.gif")
dan.attendances.create(event: school_afterparty)
dan.posts.create(event: school_afterparty, post_content: "Me the next day", image_url: "http://fluffy-kitten.com/wp-content/uploads/2014/05/sleepy-kittens.jpg")
chris.attendances.create(event: school_afterparty)

testuser.attendances.create(event: movies)
chris.attendances.create(event: movies)
dan.attendances.create(event: movies)

erica.posts.create(event: movies, post_content: "I've heard really good things about this movie, guys! I'm really excited! Let's go early so we get good seats!", image_url: "")
dan.posts.create(event: movies, post_content: "I'm basically this excited", image_url: "http://tonyortega.org/wp-content/uploads/2014/05/CouchJump.jpg")
