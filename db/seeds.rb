# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#SETdata
user_hash = {:id => "1",
             :email => "test@test.test",
             :password => "testtest",
             :password_confirmation => "testtest"
            }
post_hash = {:id => "1",
             :user_id => "1",
             :title => "belongs_to user id=1",
             :content => "user id = 1 "
            }
discussion_hash = {:post_id => "1",
                   :user_id => "1",
                   :content => "post id = 1 && user id = 1"
                  }
profile_hash = {:user_id => "1",
                :name => "id1",
                :age => "1",
                :location => "id1 city",
                :gender => "1"
               }
#SETdata

User.create(user_hash)
Post.create(post_hash)
Discussion.create(discussion_hash)
Profile.create(profile_hash)
 
