class Relationship < ApplicationRecord
   # フォローする側
   belongs_to :follower, class_name: "User"
   # フォローされる側
   belongs_to :followed, class_name: "User"
end
