class User < ActiveRecord::Base
  before_create :generate_registration_confirmation_token
  
  has_secure_password validations: false
  
  validates_confirmation_of :password, unless: :twitter_user?
  validates_presence_of     :password, on: :create, unless: :twitter_user?
  validates_presence_of     :password_confirmation, unless: :twitter_user?
  
  validates :email, presence: true,
                    unless: :twitter_user?
  validates :email, uniqueness: true,
                    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/ },
                    unless: :twitter_user?
                                        
  before_save :downcase_email
  after_create :get_twitter_followers, :get_twitter_following

  has_many :memberships
  has_many :hackathons, :through => :memberships

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy                                
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_one :twitter_account
  
  def twitter_user?
    self.twitter_account.present?
  end
  
  def admin?
    self[:email].end_with?("hackevents.co")
  end
  
  def downcase_email
    if self.email.present?
      self.email = email.downcase
    end
  end

  def generate_password_reset_token!
    update_attribute(:password_reset_token, SecureRandom.urlsafe_base64(48))
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end


  # Follow a hackathon
  def follow_hackathon(hackathon)
    self.memberships.create(hackathon_id: hackathon.id)
  end
  # Unfollow a hackathon
  def unfollow_hackathon(hackathon)
    self.memberships.where(hackathon_id: hackathon.id).destroy_all
  end

  # Returns true if the current user is following the hackathon.
  def following_hackathon?(hackathon)
    Membership.exists?(['user_id = ? AND hackathon_id = ?', self.id, hackathon.id])
  end

  # Follows a user.
  def follow_user(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow_user(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following_user?(other_user)
    following.include?(other_user)
  end

  # Returns true if the current user is followed by the other user.
  def followed_by_user?(other_user)
    followers.include?(other_user)
  end



  def isUser?(id)
    TwitterAccount.exists?(uid: id)
  end

  def getUser(uid)
    TwitterAccount.find_by(uid: uid)
  end


  def get_twitter_following
    following_id_array = TwitterAccount.pluck(:uid) & self.twitter_account.client.friend_ids.to_a
    user_id_array = TwitterAccount.where(uid: following_id_array).pluck(:user_id)
    user_id_array.each do |id|
      unless self.following_user?(User.find_by(id: id))
        self.active_relationships.create(followed_id: id)
      end
    end
  end

  def get_twitter_followers
    follower_id_array = TwitterAccount.pluck(:uid) & self.twitter_account.client.follower_ids.to_a
    user_id_array = TwitterAccount.where(uid: follower_id_array).pluck(:user_id)
    user_id_array.each do |id|
      unless self.followed_by_user?(User.find_by(id: id))
        self.passive_relationships.create(follower_id: id)
      end
    end
  end




  private
  def generate_registration_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end
