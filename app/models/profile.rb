class Profile < ApplicationRecord

  #paperclip
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", discussion: "64x64>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  #_________
  belongs_to :user

end
