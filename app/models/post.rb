class Post < ApplicationRecord
  belongs_to :user
  has_many :discussions
  belongs_to :group  

end
