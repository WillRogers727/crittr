class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates :email, presence: :true, uniqueness: { case_sensitive: false }

  has_many :posts
  has_many :artworks
  has_many :comments
  has_many :reviews
  has_many :notes

  has_attached_file :avatar, styles: { medium: "200x200#", thumb: "50x50#" }, default_url: ActionController::Base.helpers.asset_path("blankAvatar.png")
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :conversations, :foreign_key => :sender_id

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy #destroying a user also destroys their relationships

  has_many :passive_relationships, class_name: "Relationship",
                                    foreign_key: "followed_id",
                                    dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower


  def postFeed
    following_ids = "SELECT followed_id FROM relationships WHERE  follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})", user_id: id) 
    #returns a feed of posts with following user's ids, with a second sql snippet injected
  end

  def artworkFeed
    following_ids = "SELECT followed_id FROM relationships WHERE  follower_id = :user_id"
    Artwork.all.where("user_id IN (#{following_ids})", user_id: id) 
    #returns a feed of artworks with following user's ids, with a second sql snippet injected
  end

  #follows a user
  def follow(other_user)
    following << other_user
  end

  #unfollows a user
  def unfollow(other_user)
    following.delete(other_user)
  end

  #returns true if the current user is following another user
  def following?(other_user)
    following.include?(other_user)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name
      user.save
    end
  end

  def apply_omniauth(auth)
    update_attributes(
        provider: auth.provider,
        uid: auth.uid
      )
  end

  def has_facebook_linked?
    self.provider.present? && self.uid.present?
  end

end
