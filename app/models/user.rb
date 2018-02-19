class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :artworks
  has_many :comments


  has_attached_file :avatar, styles: { medium: "200x200#", thumb: "50x50#" }, default_url: ActionController::Base.helpers.asset_path("blankAvatar.png")
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :conversations, :foreign_key => :sender_id
end
